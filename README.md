# RHEL 10 & Ansible Automation Suite

Multi-node Linux infrastructure automation archive built for **Red Hat Certified Engineer (RHCE — RHEL 10)** preparation. Covers end-to-end provisioning, storage, networking, security hardening, and service orchestration across ephemeral KVM lab fleets using modern `ansible-navigator` Execution Environments.

## Tech Stack & Scope
* **Toolchain:** `ansible-navigator`, custom Ansible Execution Environment (`Containerfile`), FQCNs (`ansible.builtin`, `ansible.posix`, `community.general`, `containers.podman`), Ansible Vault (`AES256`).
* **Storage & Filesystems:** GPT partitioning (`parted`), LVM volume groups/logical volumes with PE tuning, `ext4`/`xfs` formatting, swap management, and NFSv4 mounts.
* **Networking & Security:** `nmcli` static addressing and extended routing, `firewalld` zone/port/service policies, SELinux (`sefcontext`, `seboolean`, `seport`), SSH hardening, and `visudo`-validated sudoers drop-ins.
* **Systems & Services:** `httpd`, `mariadb`, `squid`, `chrony`, `cockpit`, `systemd` service management, `cron` scheduling, and idempotent user/group lifecycle automation.

## Repository Structure
| Directory / File | Description |
|---|---|
| `Containerfile` | Custom Ansible Execution Environment image definition with required collections. |
| `golden_template/` | Baseline project skeleton (`ansible.cfg`, `ansible-navigator.yml`, inventory, encrypted vault). |
| `special_mockup/` | Full multi-host (`alpha`–`epsilon`) scenario covering storage, networking, SELinux, firewalld, and services. |
| `full_mockup1` – `full_mockup6/` | Timed, full-scope RHCE exam simulations across multi-node topologies. |
| `mono1` – `mono12/` | Role-based monolithic automation drills covering progressive infrastructure modules. |
| `drills/`, `drills_second/`, `final_drill/` | Targeted speed drills for specific subsystems and exam edge cases. |

## Usage
Each lab directory is self-contained with its own `ansible.cfg`, `ansible-navigator.yml`, and `inventory.ini`.

```bash
# Build the custom Execution Environment
podman build -t localhost/custom-ee .

# Run a scenario against your target inventory
cd special_mockup
ansible-navigator run site.yml
