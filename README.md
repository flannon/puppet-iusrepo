# iusrepo

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with iusrepo](#setup)
    * [What iusrepo affects](#what-iusrepo-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with iusrepo](#beginning-with-iusrepo)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)

## Overview

This module enables ius repos.

## Module Description



## Setup


### Setup Requirements **OPTIONAL**


## Usage

Basic usage:

    include iusrepo

General usage:

    class { 'iusrepo' :
        enabled => ['ius'],
    }
    

## Reference

This module barows heavily from yguenane/repoforge. You can find yguenane/repoforge here, https://github.com/Mylezeem/puppet-repoforge.

## Limitations

Currently enabled for RHEL and dirivatives only.

