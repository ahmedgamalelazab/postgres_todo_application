//in this module we will build a function to send emails using nodemailer and service called SendGrid
const nodemailer = require("nodemailer");


const sendEmail =async function (options){

    const transporter = nodemailer.createTransport({
        service : process.env.EMAIL_SERVICE,
        auth : {
            user : process.env.EMAIL_USER,
            pass : process.env.EMAIL_PASSWORD
        }
    })

    //if u miss any of those things ur email will be on hold and won't be sent
    const mailOptions = {
        from : process.env.EMAIL_FROM,
        to : options.to,
        subject : options.subject,
        html : options.text
    }

    try{
        const info = await transporter.sendMail(mailOptions);
        if(!info){
            console.log("failed to send email");
        }else{
            return info;
        }
    }catch(err){
        return new Error("failed to user the email service");
    }



}

module.exports = sendEmail;