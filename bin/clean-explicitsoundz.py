import os
import re
import argparse
import fnmatch
from pprint import pprint

from mutagen.id3 import ID3
from mutagen.mp3 import MP3

parser = argparse.ArgumentParser(description="Removes ExplicitSoundz Crap")
parser.add_argument('path')

def instances_of_crap(tag):
    crap = re.compile(r'ExplicitSound(s|z)jam(s|z)', re.IGNORECASE)

    data = []
    data.extend(getattr(tag, 'text', []))
    data.extend(getattr(tag, 'url', []))
    instances = [c for c in data if crap.search(c.encode('UTF-8')) is not None]

    return instances

def has_crap(tag):
    return (len(instances_of_crap(tag)) > 0)

def clean(path):
    for root, dirs, files in os.walk(path):
        print root, dirs, files
        for file in fnmatch.filter(files, '*.mp3'):
            tags = ID3(os.path.join(root, file), translate=True)
            for name, tag in tags.items():
                if has_crap(tag):
                    print "Removing {t} from {f}".format(
                        f=file,
                        t=name
                    )
                    del tags[name]
                    tags.save()

def main():
    args = parser.parse_args()
    clean(args.path)

if __name__ == '__main__':
    main()
