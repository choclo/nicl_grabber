nic.cl Domain Checker
===================

What it does?
-------------
This is a very rustic implementation of an automatic domain checker. This script with the help of your friend, the linux cron, it will help you get the domain you want in case it expires. It will send you an email if the domain becomes available so you can grab it ASAP!

> **Note:**

> - In order to send emails you will need to have a fully working SMTP server (which in this case, is on the same server as the script).
> - You will need to have the cron service working for the script to run at xx hour or every xx hours.

How to use it
-------------
If you are here, most likely you know how cron runs and how to edit a script. So make sure to change the following fields at the beginning of the file:

```
sender_name = "Whatever Name"
sender_email = "Whatever Email"
recipient_name = "Recipient's Name"
recipient_email = "Recipient's Email"
 ```

You will need to pass the domains you want to check as arguments:
```
# ruby chkdomain.rb domainone.cl domaintwo.cl
```

That should do it. If you run into issues open a ticket or can improve the code (I'm a ruby beginner after all) submit a pull request.
