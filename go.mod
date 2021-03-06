module github.com/lyraproj/lyra

require (
	github.com/go-logr/logr v0.1.0
	github.com/hashicorp/go-hclog v0.8.0
	github.com/hashicorp/go-plugin v0.0.0-20190220160451-3f118e8ee104
	github.com/inconshreveable/mousetrap v1.0.0 // indirect
	github.com/leonelquinteros/gotext v1.4.0
	github.com/lyraproj/hiera v0.0.0-20190329232239-0a668ca79a0a
	github.com/lyraproj/identity v0.0.0-20190408135217-4fc7f86b6fb3
	github.com/lyraproj/issue v0.0.0-20190329160035-8bc10230f995
	github.com/lyraproj/lyra-operator v0.0.0-20190315160732-5cae8a9bc88d
	github.com/lyraproj/pcore v0.0.0-20190408134742-7ef8f288585f
	github.com/lyraproj/puppet-workflow v0.0.0-20190408135127-39314d42d0f4
	github.com/lyraproj/servicesdk v0.0.0-20190408134916-985421696619
	github.com/lyraproj/terraform-bridge v0.0.0-20190408135359-a8c691855a82
	github.com/lyraproj/wfe v0.0.0-20190408135039-be57c7687d8f
	github.com/mattn/go-colorable v0.1.1 // indirect
	github.com/mgutz/ansi v0.0.0-20170206155736-9520e82c474b
	github.com/pkg/errors v0.8.1 // indirect
	github.com/prometheus/client_model v0.0.0-20190129233127-fd36f4220a90 // indirect
	github.com/prometheus/common v0.2.0 // indirect
	github.com/prometheus/procfs v0.0.0-20190209105433-f8d8b3f739bd // indirect
	github.com/spf13/cobra v0.0.3
	github.com/stretchr/testify v1.3.0
	gonum.org/v1/netlib v0.0.0-20190314102120-fc220b4194ca // indirect
	k8s.io/client-go v10.0.0+incompatible
	sigs.k8s.io/controller-runtime v0.1.10
)

replace github.com/google/go-github => github.com/google/go-github v16.0.0+incompatible // terraform-bridge GitHub plugin requires this version
