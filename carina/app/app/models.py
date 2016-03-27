from django.db import models

# Create your models here.
class Guest(models.Model):
    name = models.CharField(max_length=200)
    email = models.CharField(max_length=200)
    x_real_ip = models.CharField(max_length=200, null=True)
    x_forwarded_for = models.CharField(max_length=200, null=True)
    remote_addr = models.CharField(max_length=200)
    user_agent = models.CharField(max_length=200)
    
    def __str__(self):  # __unicode__ on Python 2
        return "[Guest: id={}, name={}, email={}]".format(self.id, self.name, self.email)
