# This is a Shiny web application to run the real package (beaverApp) from GitHub, along with custom regional data (also on gitHub)


#  the demo data backend 
options(beaverApp.data.pkg = "beaverAppDataEngland")   #  data package for this deployment 
Sys.setenv(BEAVERAPP_DATA_PKG = "beaverAppDataEngland", 
           APP_MODE="normal",    
           BEAVERAPP_VERBOSE =FALSE,
           APP_REGION= "England")
           # BEAVERAPP_PASSWORD=  XXX  

app_password <<- Sys.getenv("BEAVERAPP_PASSWORD") 

 

options(shiny.maxRequestSize = 7200 * 1024^2)  # just in case, 7200MB uploads
options(rsconnect.max.bundle.size=3145728000)


if (!is.na(Sys.getenv("SHINY_PORT", unset = NA))) {
  future::plan("sequential")
}

cat("\n>>> launching beaverApp from England wrapper >>>\n") 
beaverApp::launch_app(run = FALSE) 
