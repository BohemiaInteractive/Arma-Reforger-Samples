[WorkbenchPluginAttribute(name: "Sample Resource Manager Plugin", category: "Sample Plugins", shortcut: "Ctrl+T", wbModules: {"ResourceManager"}, awesomeFontCode: 0xf0c5)]
class SampleResourceManagerPlugin: ResourceManagerPlugin
{
	// Plugins settings - those can be changed in Plugins -> Settings section 
	[Attribute("0", UIWidgets.CheckBox, "Check this option to print output to clipboard.")]
	bool m_CopyToClipboard;
	
	[Attribute("0", UIWidgets.CheckBox, "Check this option to print output array to the console log.")]
	bool m_PrintToConsole;
	
	
	// ButtonAttributes 
	[ButtonAttribute("OK")]
	void OkButton()	 {}
	
	// Cancel button
	[ButtonAttribute("Cancel")]
	bool CancelButton()	
	{
		return false;
	}
	
	// Button responsible for importing plugin parameters from clipboard
	[ButtonAttribute("Import")]
	void ImportButton()	
	{
		// Get content of user clipboard
		string input = System.ImportFromClipboard();
		
		// Verify input
		if(input == "") return;
		
		// Parse input
		array<string> parsedText = new array<string>;
		input.Split(" ",parsedText,false);
		
		// Verify parse input
		int parsedTextCount = parsedText.Count();
		if(parsedTextCount != 2) 
		{
			PrintFormat("Invalid parameter count, typed %1 parameters while 2 were expected",parsedTextCount);
			return;
		}
		
		// Update variables states according to clipboard data		
		m_CopyToClipboard = parsedText[0].ToInt();
		m_PrintToConsole = parsedText[1].ToInt();
	}
	
	// Button responsible for exporting plugin parameters to clipboard
	[ButtonAttribute("Export")]
	void ExportButton()	
	{
		string export;
		export = string.Format("%1 %2",m_CopyToClipboard,m_PrintToConsole);
		System.ExportToClipboard(export);
	}
	
	// Code which is executed when settings are accesed
	override void Configure()
	{
		Workbench.ScriptDialog("Plugin script dialog title", "Description of the plugin\nThis description can use multiple lines.\nPress export to copy plugin settings to clipboard.\nPress import to grab data from clipboard.", this);
	}
	
	override void RunCommandline()
	{
	    ResourceManager resourceManager = Workbench.GetModule(ResourceManager);
	 
		// Default values
		string param = "$ArmaReforger:";
		string autoclose = "0";
		
		// First parameter called myParameter
		resourceManager.GetCmdLine("-myParameter", param);
		resourceManager.GetCmdLine("-autoclose", autoclose);
		
		// Print parameters in console
		PrintFormat("CLI parameters -myParameter= %1 -autoClose=%2",param,autoclose);
		
		// Find any .et (prefab) files in selected location
		array<string> files = {};
		System.FindFiles(files.Insert, param, ".et");
		int numberOfFiles = files.Count();
		
		// Print number of all files to Log Console
		Print(numberOfFiles);
	 
		// Export to clipboard result of the search
		System.ExportToClipboard("Number of all .et files in " + param + " = " + numberOfFiles.ToString());
		
		// Close workbench if autoclose parameter is set to 1
	    if (autoclose == "1")
	        Workbench.Exit(0);
	}
	
	// This method is executed every time some new resource is registered
	override void OnRegisterResource(string absFileName, BaseContainer metaFile)
	{
		if(m_PrintToConsole) 
		{
			// Print directly to the Log Console absolute path & file name of newely registerd resource
			Print(absFileName);
		}
		if(m_CopyToClipboard)
		{
			// Copy file name to clipboard
			System.ExportToClipboard(absFileName);
		}
	}
	
	// This code is executed when plugin is executed either by clicking on it in Plugins list or when shortcut is used
	override void Run()
	{
		// Grab reference to ResourceManager 
		ResourceManager resourceManager = Workbench.GetModule(ResourceManager);
		if (! resourceManager) return;
		
		// Get list of currently selected resources
		array<ResourceName> selection = new array<ResourceName>;
		SCR_WorkbenchSearchResourcesCallbackArray context = new SCR_WorkbenchSearchResourcesCallbackArray(selection);
		resourceManager.GetResourceBrowserSelection(context.Insert, true);
		
		
		// Verify if something is selected - if no, exit method & print error message
		if(selection.Count() == 0)
		{
			Print("No elements are selected in Resource Browser");
			return;
		}
		
		if(m_PrintToConsole) 
		{
			// Print ResourceManager selection directly to the console
			Print(selection);
		}
		
		if(m_CopyToClipboard)
		{
			// Copy file name to clipboard - each element will be written on new line
			string export;
			foreach (string element : selection)
			{ 
				export = export +  "element: " + element + "\n";
			}
			
			System.ExportToClipboard(export);
		}
	}
}

// Variant of the plugin which opens settings UI on each run - inherits from basic SampleResourceManagerPlugin
[WorkbenchPluginAttribute(name: "Sample Resource Manager Plugin (Settings)", category: "Sample Plugins", shortcut: "Ctrl+R", wbModules: {"ResourceManager"}, awesomeFontCode: 0xf085)]
class SampleResourceManagerPluginSettings: SampleResourceManagerPlugin
{
	// We don't want import & export buttons anymore. Overriding without providing ButtonAttribute above it is enough to stop it from showing
	override void ImportButton() {}
	override void ExportButton() {}
	
	void KillProcess(ProcessHandle handle)
	{
		// Sleep is in miliseconds!
		Sleep(2000);
		
		// Kill process passed to this method
		Workbench.KillProcess(handle);
	}
	
	[ButtonAttribute("Ping")]
	void PingBohemia()	
	{
		// Ping bohemia.net page
		Workbench.RunCmd("ping bohemia.net");
	}
	
	[ButtonAttribute("Notepad")]
	void OpenNotepad()	
	{
		// Open notepad 
		ProcessHandle handle = Workbench.RunProcess("notepad");
		
		if (!handle)
			Print("Couldn't start the notepad.", LogLevel.ERROR);
			return;
		
		// Run separate thread where notepad will be killed after 2000 miliseconds
		thread KillProcess(handle);
	}
	
	override void Configure()
	{
		Workbench.ScriptDialog("Configure settings", "", this);
	}
	
	override void Run()
	{
		Workbench.ScriptDialog("Configure settings", "", this);
		super.Run();
	}
}