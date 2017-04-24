# service_wrapper

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with service_wrapper](#setup)
    * [What service_wrapper affects](#what-service_wrapper-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with service_wrapper](#beginning-with-service_wrapper)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

Start with a one- or two-sentence summary of what the module does and/or what
problem it solves. This is your 30-second elevator pitch for your module.
Consider including OS/Puppet version it works with.

You can give more descriptive information in a second paragraph. This paragraph
should answer the questions: "What does this module *do*?" and "Why would I use
it?" If your module has a range of functionality (installation, configuration,
management, etc.), this is the time to mention it.

## Setup

### What service_wrapper affects **OPTIONAL**

If it's obvious what your module touches, you can skip this section. For
example, folks can probably figure out that your mysql_instance module affects
their MySQL instances.

If there's more that they should know about, though, this is the place to mention:

* A list of files, packages, services, or operations that the module will alter,
  impact, or execute.
* Dependencies that your module automatically installs.
* Warnings or other important notices.

### Setup Requirements **OPTIONAL**

If your module requires anything extra before setting up (pluginsync enabled,
etc.), mention it here.

If your most recent release breaks compatibility or requires particular steps
for upgrading, you might want to include an additional "Upgrading" section
here.

### Beginning with service_wrapper

The very basic steps needed for a user to get the module up and running. This
can include setup steps, if necessary, or it can be an example of the most
basic use of the module.

## Usage

This section is where you describe how to customize, configure, and do the
fancy stuff with your module here. It's especially helpful if you include usage
examples and code samples for doing things with your module.

## Reference

Here, include a complete list of your module's classes, types, providers,
facts, along with the parameters for each. Users refer to this section (thus
the name "Reference") to find specific details; most users don't read it per
se.

## Limitations

This is where you list OS compatibility, version compatibility, etc. If there
are Known Issues, you might want to include them under their own heading here.

## Development

Since your module is awesome, other users will want to play with it. Let them
know what the ground rules for contributing are.

## Release Notes/Contributors/Etc. **Optional**

If you aren't using changelog, put your release notes here (though you should
consider using changelog). You can also add any additional sections you feel
are necessary or important to include here. Please use the `## ` header.
# Puppet Service #

Run an application as a service, tested with CentOS (Red Hat?) & SuSE 11/12.

Basically just generates an appropriate init.d or systemd script, handles ruby and rails apps.

Currently only supports linux, feel free to add NSSM or something in for windoze support.


## USAGE

```
  service_wrapper { 'rainbow_sparkles_unicorn':
    service_name => 'unicorn_scalez',
    user         => 'svc-scalez',
    description  => 'Runs unicorn web server for the netscaler api',
    pre_command  => 'RAILS_ENV=production',
    command      => 'bundle exec unicorn'
  }
```

If you're running an environment that uses systemd (i.e., SLES 12), use the ```service_wrapper::systemd``` resource.

```
  service_wrapper::systemd { 'cool_systemd_thingy':
    service_name      => 'payments',
    user              => 'svc-payments',
    description       => 'Runs puma web server for payments',
    environment       => 'JRUBY_OPTS=-J-Djava.io.tmpdir=/home/svc-payments',
    working_directory => '/opt/payments/current',
    command           => 'bundle exec puma',
    timeout_sec       => 15,
    restart           => always,
  }
```

