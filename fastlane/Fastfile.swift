// This file contains the fastlane.tools configuration
// You can find the documentation at https://docs.fastlane.tools
//
// For a list of all available actions, check out
//
//     https://docs.fastlane.tools/actions
//

import Foundation

class Fastfile: LaneFile {
	func customLane() {
	desc("Description of what the lane does")
		// add actions here: https://docs.fastlane.tools/actions
	}
    
    lane :release do
    sync_code_signing
    disable_automatic_code_signing(path: "FastLaneDemo.xcodeproj")
    build_app
    enable_automatic_code_signing(path: "FastLaneDemo.xcodeproj")
    upload_to_testflight
    end
    
    lane :tests do
    path: "Users/Admin/Desktop/FastLaneDemo",
    team_id: "PHG8755F43",
    use_automatic_signing: "true"
    end

}
func betaLane() {
    desc("Submit a new Beta Build to Apple TestFlight. This will also make sure the profile is up to date")
    syncCodeSigning(gitUrl: "URL/for/your/git/repo", appIdentifier: [appIdentifier], username: appleID)
    // Build your app - more options available
    buildIosApp(scheme: "SchemeName")
    uploadToTestflight(username: appleID)
    // You can also use other beta testing services here (run `fastlane actions`)
}


lane :tests do
path: "Users/Admin/Desktop/FastLaneDemo",
team_id: "PHG8755F43",
use_automatic_signing: "true"
end

