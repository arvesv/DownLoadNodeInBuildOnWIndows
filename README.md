# DownLoadNodeInBuildOnWIndows

This is an experiment on how control the version of Node from a buildscript that works both in a pipeline, and on a developer local machines.

While we can do this in a pipeline, it is better to do it in the buildscript for two reasons:
1. You can actually debug the code (pipelines are )
2. It is one less thing the developer needs to think about. The tools are automatically installed for you

The drawbacks of this method is that we spend time doing this, we get a new dependency on the nodejs website. But hopefully
is is worthwile.
