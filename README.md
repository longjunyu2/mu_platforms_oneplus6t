# Mu OnePlus6T Platform Repository
Project Mu based OnePlus6T Platform Repo. For Building Project Mu firmware of the OnePlus6T Device.

## Current Status & Schedule
### Repository
- [x] Implement configuration of compilation environment with scripts.
- [x] Implement compilation with scripts.
- [ ] Use upstream master branch of the OnePlus6TPkg from sdm845Pkg instead of specific modified branches.
### OnePlus6TPkg
- [x] Implement configuration of compilation environment with scripts.
- [ ] Compile and get the firmware FD(Flash Device).
- [ ] Generate bootable Image file with DTB.

## Getting Started

### Details
This repository is NOT a part of Project Mu, but it depends on some parts of Project Mu.
- [mu_plus](https://github.com/microsoft/mu_plus)
- [mu_basecore](https://github.com/microsoft/mu_basecore)
- [mu_oem_sample](https://github.com/microsoft/mu_oem_sample)
- [mu_tiano_plus](https://github.com/microsoft/mu_tiano_plus)
- [mu_silicon_arm_tiano](https://github.com/microsoft/mu_silicon_arm_tiano)  

For more information about these repositories, see [Project Mu](https://microsoft.github.io/mu)

## Acknowledgement
- [mu](https://microsoft.github.io/mu): Provids details of project mu.
- [mu_tiano_platforms](https://github.com/microsoft/mu_tiano_platforms): Provides a template for such firmware projects.
- [edk2-sdm845](https://github.com/edk2-porting/edk2-sdm845): Most of the code for OnePlus6TPkg comes from sdm845Pkg.
## License
The software is distributed under BSD 2-Clause License.
