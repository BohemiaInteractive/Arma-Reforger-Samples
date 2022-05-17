[WorkbenchPluginAttribute(name: "Sample World Editor Plugin", category: "Sample Plugins", shortcut: "Ctrl+T", wbModules: {"WorldEditor"})]
class SampleWorldEditorPlugin: WorldEditorPlugin
{
	//----------------------------------------------------------------------------------------------
	override void Run()
	{
		// Get World Editor module
		WorldEditor worldEditor = Workbench.GetModule(WorldEditor);
		// Get World Editor API
		WorldEditorAPI api = worldEditor.GetApi();
		
		int selectedEntitiesCount;
		selectedEntitiesCount = api.GetSelectedEntitiesCount();
		
		// Print result to the Log Console
		Print(selectedEntitiesCount);
	}
}