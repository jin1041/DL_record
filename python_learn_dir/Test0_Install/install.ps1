# Step0:Snipaste
cd ./Snipaste
./Snipaste.exe
cd ..

# Step1:chrome
$chromeInstallerPath = "./ChromeSetup.exe"
$chromeArgs = "/install"
Start-Process -FilePath $chromeInstallerPath -ArgumentList $chromeArgs -Wait

# Step2:Vscode
.\VSCodeUserSetup.exe /silent

# # Step3:Everything
# $EvethingInstallerPath = "./EverythingSetup.exe"
# $EvethingArgs = "/VERYSILENT"
# Start-Process -FilePath $EvethingInstallerPath -ArgumentList $EvethingArgs -Wait

# Step3:Python
$pythonInstallerPath = ".\pythonSetup.exe"
$installArgs = "/quiet", "PrependPath=1", "Include_test=0"
Start-Process -FilePath $pythonInstallerPath -ArgumentList $installArgs -Wait
Write-Host "VSCode and Python installation completed."

python -m pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
python.exe -m pip install --upgrade pip

pip install -r requirements.txt
# $packages = "torch", "opencv-python", "numpy", "pandas", "matplotlib" , "matplotlib" 
# foreach ($package in $packages) {
# python -m pip install $package
# }


Write-Host "Press any key to exit..."
$host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") | Out-Null