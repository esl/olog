olog
=====

A CSI application

Build
-----

    $ rebar3 compile

Olog is a common logger framework. Currently it uses lager.

The intention is to build a logger where different application can log into
different files, based on configuration.

Also an expected behaviour is to raise alarms, send emails or sms to declared
entities that are defined in teams.eterm in cfg application.