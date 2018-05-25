#!groovy

properties(
	[
		buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '', daysToKeepStr: '', numToKeepStr: '30')),
		parameters(
			[
				string(name: 'REPO', defaultValue: 'https://github.com/google/protobuf', description: 'Docker git source repository.'),
				string(name: 'REF', defaultValue: 'v3.5.1', description: 'Docker git source repository.'),
				booleanParam(name: 'TRIGGER_RELEASE', description: 'Trigger release after a successful build', defaultValue: false),
			]
		)
	]
)

MAKE="make REF=${params.REF} REPO=${params.REPO}"

def arches = [
	"x86_64",
	"ppc64le",
	"s390x",
]

build_jobs=[:]

for (arch:arches) {
	build_jobs << [arch: -> {
		wrappedNode(label: "${arch}&&linux", cleanWorkspace: true) {
			checkout scm
			// If the image exists already we don't care and we just exit gracefully
			exitCode = sh(script: "${MAKE} exists", returnStatus: true)
			if (exitCode != 0 && params.TRIGGER_RELEASE) {
				sh("${MAKE} release")
			}
		}
	}]
}

stage("Building and pushing images") {
	parallel(build_jobs)
}
