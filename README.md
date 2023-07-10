# terraform-freeipa

[![GitHub stars](https://img.shields.io/github/stars/codejamninja/terraform-freeipa.svg?style=social&label=Stars)](https://github.com/codejamninja/terraform-freeipa)

> Initialize freeipa with terraform

Please ★ this repo if you found it useful ★ ★ ★

![](assets/terraform-freeipa.png)

## Features

* Automatically registers servers with a supported DNS provider
    * Route 53
    * CloudFlare
* Adds letsencrypt certificate to freeipa


## Dependencies

* [AWS CLI](https://aws.amazon.com/cli)
* [Terraform](https://terraform.io)
* [GNU Make](https://www.gnu.org/software/make)
* [Python 3](https://www.python.org)


## Usage

### Configure AWS CLI

```sh
aws configure
```

### Setup Freeipa Platform

```sh
cd aws
terraform init
terraform apply
```

If you want to use [route53](https://aws.amazon.com/route53) instead of [cloudflare](https://www.cloudflare.com),
set the `cloudflare_token` to `0`.

Make sure you save the generated rsa private key so you can ssh into the server.
It will be located at `ipa/ipa_<your_domain>_rsa`.


## Support

Submit an [issue](https://github.com/codejamninja/terraform-freeipa/issues/new)


## Contributing

Review the [guidelines for contributing](https://github.com/codejamninja/terraform-freeipa/blob/master/CONTRIBUTING.md)


## License

[MIT License](https://github.com/codejamninja/terraform-freeipa/blob/master/LICENSE)

[Jam Risser](https://codejam.ninja) © 2018


## Changelog

Review the [changelog](https://github.com/codejamninja/terraform-freeipa/blob/master/CHANGELOG.md)


## Credits

* [Jam Risser](https://codejam.ninja) - Author


## Support on Liberapay

A ridiculous amount of coffee ☕ ☕ ☕ was consumed in the process of building this project.

[Add some fuel](https://liberapay.com/codejamninja/donate) if you'd like to keep me going!

[![Liberapay receiving](https://img.shields.io/liberapay/receives/codejamninja.svg?style=flat-square)](https://liberapay.com/codejamninja/donate)
[![Liberapay patrons](https://img.shields.io/liberapay/patrons/codejamninja.svg?style=flat-square)](https://liberapay.com/codejamninja/donate)
