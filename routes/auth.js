const router = require("express").Router();
const {register , login , forgotPassword , resetPassword} = require("../controllers/auth");




//TODO HANDLE  register REQUEST AS  post  REQUEST 

router.route("/register").post(register);

//TODO HANDLE   login REQUEST AS post   REQUEST 

router.route("/login").post(login);

//TODO HANDLE  forgetPassword REQUEST AS  post  REQUEST 

router.route("/forgetPassword").post(forgotPassword);

//TODO HANDLE  resetPassword REQUEST AS  put  REQUEST 

router.route("/resetPassword/:resetPasswordToken").put(resetPassword);









module.exports = router;

