# Remote support

## tmate

We opt to use [tmate](https://tmate.io/) to provide remote support as it is easy to use, fully open source, and allows TeamViewer-like access to the terminal.

### Installation

Tmate comes preinstalled on our appliances, but if you have set up your environment manually, you might need to install tmate first.

On Debian / Ubuntu systems the installation is straightforward:

```bash
sudo apt-get install tmate
```

For other distributions, follow the guides provided at the [tmate](https://tmate.io/) website

### Usage

Just type `tmate` while connected via ssh or in the console of your virtual appliance.

You will be greeted with a screen like this:

```bash
Tip: if you wish to use tmate only for remote access, run: tmate -F                                                                                                                                                                      [0/0]
To see the following messages again, run in a tmate session: tmate show-messages
Press <q> or <ctrl-c> to continue
---------------------------------------------------------------------
Connecting to ssh.tmate.io...
Note: clear your terminal before sharing readonly access
web session read only: https://tmate.io/t/ro-generated_ro_id
ssh session read only: ssh ro-generated_ro_id@lon1.tmate.io
web session: https://tmate.io/t/generated_id
ssh session: ssh generated_id@lon1.tmate.io
```

Send our support engineer this information via a secure channel and ensure access is only used by our support engineer by observing the screen.
If in doubt, exit the session using the `exit` command or by pressing `ctrl-d`

