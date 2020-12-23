# str_as_object_name

    Code
      str_as_object_name(x = c("sdf", "sf", "safd`", "sdf a ", "123sd", "sadf{}sa",
        "sdf_sdf", "faf(1)", "fds2", "dsf.fs", "sdf$fds"))
    Output
       [1] "sdf"        "sf"         "safd"       "`sdf a `"   "`123sd`"   
       [6] "`sadf{}sa`" "sdf_sdf"    "`faf(1)`"   "fds2"       "dsf.fs"    
      [11] "`sdf$fds`" 

