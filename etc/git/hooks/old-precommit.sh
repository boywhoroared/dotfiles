#!/bin/sh

# PRE-COMMIT HOOK
# Prevent .php source from being committed if errors are generated from
# linting.

# To install this you can either copy or symlink it to
# $GIT_DIR/hooks/pre-commit.

# necessary check for initial commit
if git rev-parse --verify HEAD >/dev/null 2>&1
then
  # if we have previous commits, diff against HEAD 
	against=HEAD
else
	# Initial commit: diff against an empty tree object
	against=4b825dc642cb6eb9a060e54bf8d69288fbee4904
fi

# FYI: Alternative/Old Method
# Copy the staged files to a temporary directory and then lint.

# get the root dir of the repo
root_dir=$(git rev-parse --show-toplevel)
precommit_dir="$root_dir/.git-precommit"
changed_files=$(git diff-tree -r --cached --no-commit-id --names-only --diff-filter ACMR $against --)

if [ "$changed_files" == "" ]
then
  exit 0
fi

# create the temporary directory
if [ -d $precommit_dir ]
then 
  rm -rf $precommit_dir
fi
mkdir -p $precommit_dir

# copy the staged files to temp
git checkout-index --prefix=$precommit_dir/ -af

# lint
find $precommit_dir -name '*.php' -print | xargs -n 1 php -l
