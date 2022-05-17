[WorkbenchPluginAttribute(name: "Sample Script Editor Plugin", category: "Sample Plugins", shortcut: "Ctrl+T", wbModules: {"ScriptEditor"}, awesomeFontCode: 0xf02f)]
class SampleScriptEditorPlugin: WorkbenchPlugin
{
	override void Run()
	{
		ScriptEditor scriptEditor = Workbench.GetModule(ScriptEditor);
		if (! scriptEditor) return;
		
		
		// Try to get currently selected file
		string file;
		if(! scriptEditor.GetCurrentFile(file) ) 
		{
			Print("No file is currently selected!");
			return;
		}
		
		// Try to get absolute path to currently selected file
		string absPath;
		if(! Workbench.GetAbsolutePath(file, absPath) ) 
		{
			Print("Workbench was unable to get absolute path of selected file!");
			return;
		}
		
		
		// Print local & absolute path of currently opened file
		Print(file);
		Print(absPath);
		
		// Print current Line
		string currentLine;
		scriptEditor.GetLineText(currentLine,  -1);
		Print(currentLine);
		
		// Copy file name to clipboard
		System.ExportToClipboard(file);
	}
}