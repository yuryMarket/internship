## Result of the main part:
[http://3.67.202.19/](http://3.67.202.19/)  

## Result of the external part
[https://task2vpc1screenshot.s3.eu-central-1.amazonaws.com/Screenshot%202022-06-18%2020.00.46.png](https://task2vpc1screenshot.s3.eu-central-1.amazonaws.com/Screenshot%202022-06-18%2020.00.46.png?response-content-disposition=inline&X-Amz-Security-Token=IQoJb3JpZ2luX2VjEOj%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaDGV1LWNlbnRyYWwtMSJIMEYCIQDWyttbet7d1hJW1PfGRaJCP%2FzygdF19hmncgXVQAheqgIhANglzgT9MqbnWBc3iX4WMVbvGkjy81v9fI95KO6XNG0BKu0CCPH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMNzY3NzA2MzAzNDkyIgzeqolWt3uMEYScSXIqwQJXZx8NajyZ%2FEXaoAytmAG2ULVHfFpmrGqOGNbV0S62VXtYvqQ%2FdWReQlDPrWjqPaKME2Jrop1E6niNzRjYvu948LDjzullC4q9YPHkH%2B0ncxP9DOLANW4KcOfekl%2B5axPaxMagoX%2Fc4xB7xd4q0%2BIuWSfHyFrL60kZuOrWF%2B%2FBuZaNN5%2FDpppy%2BnOLP5Ah9mxRiDxsHUBYcD5b%2BIk124dprYCXz5rPQSp1ZyJ%2FEgtYzC4Xs75AaWJg7DyG4MC6oNmftySX2zULquFC%2BVwD4sTgLDFPwOYX1HOFyFCtBe%2FM5QIS0gGIBd8fDCuJtPJE2i2MRMDGMluT%2BwJgE0fyy%2Bos%2BHiCl2%2Fwgrx3FpDhmswxIpnQyIIsncVjiV5W2RxZsp2couViKcNKGmc8NQoeMuuP%2FXV4mTgTDyR33VcHdP%2BXi30wgpe2lQY6sgJnLo0JhNi8dvK9dLjxEGazzggkvqCt%2BTjWEkuaIgvikkn%2FFQN%2BVBdthf%2Fv8lIpNnAUSu0D54peIkZMPMq7%2BXB9WdkANEuHfPzcv6A00uPzdx1EO%2Fk54p4AioIAGMIJOrjWsKUZydk9mhpKitdO96Idihra549lVjhgFmP1kfdalD%2FinVwUPH4LOw0nx4WJk5izVZXyKTaTvBPyRH617eAlksNRjIR2v76uT7dHvrCehaKfxk0wihDupeNfBexzqjH59%2BW%2BTn8hJ8LT%2FIEQxX5CInN51VrWw3exkvyzb%2FUFj7FdTNsmYVpKWLAp%2BIm18g%2Fx%2FwbWuJA217QPYaz0gUQ2LFru8BPgWGYRsH01KzueVldBlqqfLOr%2BTKRGK98q3An4VwNRTrlcgezw8GOZ9RzlrBU%3D&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20220618T160500Z&X-Amz-SignedHeaders=host&X-Amz-Expires=300&X-Amz-Credential=ASIA3FPW4RQCDXAIV5HA%2F20220618%2Feu-central-1%2Fs3%2Faws4_request&X-Amz-Signature=948092906ec994921edf8b46584cb020dd6626b78df79b73c8b4f81176b03589)
      

# My tasks in Task 2

 1. Sign up for AWS, familiarize yourself with the basic elements of the AWS Home Console GUI.
2. Explore AWS Billing for checking current costs. 
3. Create two EC2 Instance t2.micro with different operating systems (Amazon linux / Ubuntu ...). Try to stop them, restart, delete, recreate.
4. Make sure there is an SSH connection from your host to the created EC2. What IP EC2 used for it?  
Make sure  ping and SSH are allowed from one instance to another in both ways. Configure SSH connectivity between instances using SSH keys.
1. Install web server (nginx/apache) to one instance; 
- Create a web page with the text “Hello World” and additional information about OS version, free disk space,  free/used memory in the system and about all running processes;
- Make sure your web server is accessible from the internet and you can see your web page in your browser; 
- Make sure on the instance without nginx/apache you also maysee the content of your webpage from the instance with nginx/apache.
 

 
### EXTRA (optional): 
1. Run steps 3-6 with instances created in different VPC. (connectivity must be both external and internal IP)	
2. Write BASH script for installing web server (nginx/apache) and creating web pages with text “Hello World”, and information about OS version
Run step.6 without “manual” EC2 SSH connection.
### EXTRA (optional optional):
1. Make a screenshot only of your web page сontent from your browser.
2. Create your S3 bucket and place your screenshot there.
Make your screenshot visible on the internet for everyone and make sure it works.
 








