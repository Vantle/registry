def _pass(ctx):
    ctx.actions.write(
        output = ctx.outputs.executable,
        content = "#!/usr/bin/env sh\nexit 0\n",
        is_executable = True,
    )

    return [DefaultInfo(executable = ctx.outputs.executable)]

pass_test = rule(
    implementation = _pass,
    test = True,
)
