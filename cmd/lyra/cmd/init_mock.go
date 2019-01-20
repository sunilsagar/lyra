package cmd

import (
	"fmt"
	"path/filepath"

	"k8s.io/client-go/tools/clientcmd"
	"k8s.io/client-go/util/homedir"

	t "github.com/lyraproj/lyra/pkg/strings"

	"github.com/spf13/cobra"
	"github.com/spf13/viper"
)

var (
	connectiontimeout int
	host              string
	kubeconfig        string
	kubecontext       string
	kubenamespace     string
)

// NewInitCmd returns the init subcommand
func NewInitCmd() *cobra.Command {

	cmd := &cobra.Command{
		Use:        "init",
		Example:    "init",
		Short:      "init",
		Long:       "init",
		Run:        runInit,
		SuggestFor: []string{"install"},
	}

	// Flags for k8s
	if home := homedir.HomeDir(); home != "" { // Not sure why I have to do this, but if I don't kube client complains later.
		cmd.PersistentFlags().StringVar(&kubeconfig, "kubeconfig", filepath.Join(home, ".kube", "config"), "absolute path to the kubeconfig file to use")
	} else {
		cmd.PersistentFlags().StringVar(&kubeconfig, "kubeconfig", "", "absolute path to the kubeconfig file to use")
	}
	cmd.PersistentFlags().IntVarP(&connectiontimeout, "cygnus-connection-timeout", "t", 300, "the duration (in seconds) Lyra will wait to establish a connection to Cygnus")
	cmd.PersistentFlags().StringVar(&host, "cygnus-host", getKubeHost(kubeconfig), "Address of Cygnus (probably a Kubernetes master)")
	cmd.PersistentFlags().StringVarP(&kubenamespace, "kube-namespace", "n", "kube-system", "Kubernetes namespace for Cygnus")
	cmd.PersistentFlags().StringVar(&kubecontext, "kube-context", "", "Name of the kubeconfig context to use")

	cmd.SetHelpTemplate(t.HelpTemplate)
	cmd.SetUsageTemplate(t.UsageTemplate)

	viper.BindPFlag("cygnus-host", cmd.PersistentFlags().Lookup("cygnus-host"))
	viper.BindPFlag("cygnus-connection-timeout", cmd.PersistentFlags().Lookup("cygnus-connection-timeout"))
	viper.BindPFlag("kubeconfig", cmd.PersistentFlags().Lookup("kubeconfig"))
	viper.BindPFlag("kube-context", cmd.PersistentFlags().Lookup("kube-context"))
	viper.BindPFlag("kube-namespace", cmd.PersistentFlags().Lookup("kube-namespace"))

	return cmd
}

func runInit(cmd *cobra.Command, args []string) {
	h := viper.GetString("cygnus-host")
	fmt.Println("")
	fmt.Println("Cygnus (the Lyra server components) has been installed into a Kubernetes cluster at " + h + ".")
	fmt.Println("")
	fmt.Println("For more information on using Lyra with Cygnus, see https://github.com/lyraproj/docs/cygnus.md")
}

func getKubeHost(kubeconfig string) string {
	// https://github.com/kubernetes/client-go/blob/master/examples/create-update-delete-deployment/main.go
	config, err := clientcmd.BuildConfigFromFlags("", kubeconfig)
	if err != nil {
		panic(err)
	}
	if config.Host != "" {
		return config.Host
	}
	return ""
}