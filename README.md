
I'm using this project to explore ways to structure infrastructure projects. See https://cloudspin.io for background. This isn't intended to be usable, it's purely for me to play around.

This is a "stack definition project". It contains re-usable code that can be used to create multiple instances of an infastructure stack, in this case AWS networking structures.

The code in this project is built into a versioned artefact. For the most part, the stuff here should be limited to what's needed to build the artefact. Some additional things are used to work on the code locally, and test it.

In order to deliver this code into usable environments, a separate project, https://github.com/cloudspinners/spin-stack-network-delivery, contains infrastructure code that creates a delivery pipeline, IAM roles, s3 buckets for remote state, and other moving parts.


## Potential principles

- This project should not depend on the -delivery project. You can check this out and work on it, run and test your own local/sandbox instance, and push changes. You will probably need to put things into your local configuration (`stack-instance-local.yaml`) to make it work, and in practice you might use things (like statebuckets, IAM roles) from the -delivery project to set these, but they aren't a part of the project codebase that goes into source control.
- This project doesn't know about specific instances of the stack. So environment configuration doesn't belong here. This should help enforce a clean separation.

