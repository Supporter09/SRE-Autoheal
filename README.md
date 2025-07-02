# 🛠️ Auto-Heal & Audit: Linux Service Resilience Tool

A lightweight **Bash-based Site Reliability Engineering (SRE) tool** to monitor and auto-recover critical Linux services, with all incidents version-controlled in **Git** for auditability.

---

## 🚀 Features

- 🔄 Automatic health checks for systemd-managed services (e.g., `nginx`, `postgres`, `docker`)
- 🔧 Self-healing: automatically restarts failed services
- 📝 Incident logging in Markdown + service status dumps
- 📜 Git-based change tracking and commit history
- 📬 Optional: Slack or email notifications

---

## 📊 Why Use This?

This tool helps you:
- Practice core **SRE principles** (resilience, observability, MTTR tracking)
- Learn and apply **GitOps for ops auditing**
- Work with **Bash**, `cron`, `systemctl`, and `git` in a practical SRE context

---

## ⚙️ Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/yourname/sre-autoheal.git
cd sre-autoheal
```

### 2. Make Script Executable
```bash
chmod +x check_and_heal.sh
```

### 3. Setup cronjob 
- Edit crontab
```bash
crontab -e
```

- Add cronjob configuration to run every minute
```bash
* * * * * /path/to/sre-autoheal/check_and_heal.sh >> /dev/null 2>&1
```


