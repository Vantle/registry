def _command(ctx):
    content = """#!/usr/bin/env sh
set -eu

root="$(git rev-parse --show-toplevel)"
target="$root/.git/hooks"
source="$root/system/git/hooks"

mkdir -p "$target"

for hook in commit-msg pre-commit pre-push pre-rebase
do
    cp "$source/$hook" "$target/$hook"
    chmod 755 "$target/$hook"
done

git config --local pull.rebase true
git config --local rebase.autoStash false
git config --local branch.autoSetupRebase always
"""

    ctx.actions.write(
        output = ctx.outputs.executable,
        content = content,
        is_executable = True,
    )

    return [DefaultInfo(executable = ctx.outputs.executable)]

command = rule(
    implementation = _command,
    executable = True,
)
