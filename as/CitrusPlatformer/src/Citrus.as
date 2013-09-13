package {
  
  import flash.utils.getDefinitionByName;
  import flash.events.Event;
  import com.citrusengine.core.StarlingCitrusEngine;
  
  [SWF(width="1024", height="768", frameRate="60", backgroundColor="#59B3FF")]
  public class Citrus extends StarlingCitrusEngine {
    public function Citrus(  ){
      setUpStarling();
      state = new GameState();
    }
    override protected function handleStageDeactivated ( event : Event ) : void {
      // in case of live coding do nothing
      try {
        getDefinitionByName("codeOrchestra.actionScript.liveCoding.util.LiveCodeRegistry");
      } catch ( error : ReferenceError ) {
        super.handleStageDeactivated(event);
      }
    }
  }
}




