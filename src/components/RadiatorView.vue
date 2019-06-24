<template>
<div>
    <radiator-group :list="fails"></radiator-group>
    <radiator-group :list="aborted"></radiator-group>
    <radiator-group :list="stables"></radiator-group>
    <radiator-group :list="disableds"></radiator-group>
    <radiator-group :list="unknowns"></radiator-group>
</div>
</template>

<script>
  import RadiatorJob from '@/components/RadiatorJob'
  import RadiatorGroup from '@/components/RadiatorGroup'
  export default {
    name: 'radiator-view',
    data () {
      return {
        view: 'Jenkins Radiator',
        jobs: [],
        fails: [],
        stables: [],
        disableds: [],
        aborted: [],
        unknowns: [],
        interval: ''
      }
    },
    components: {
      RadiatorJob, RadiatorGroup
    },
    created () {
      // fetch the data when the view is created or when the data is
      // already being observed
      this.loadData()
    },
    watch: {
      // call again the method loadData if the route changes
      '$route': 'loadData'
    },
    computed: {
    },
    methods: {
      orderedJobs (jobs) {
        return this._.orderBy(jobs, ['lastBuild.timestamp'], ['desc'])
      },
      loadData () {
        this.view = this.$route.params.view
        this.$http.get('/view/%s/api/json?depth=1&tree=jobs[name,color,url,lastBuild[number,url,timestamp]]'.replace('%s', this.view)).then((response) => {
          this.stables = []
          this.disableds = []
          this.fails = []
          this.aborted = []
          this.unknowns = []
          response.data.jobs.forEach((job) => {
            switch (job.color) {
              case 'blue':
              case 'blue_anime':
                this.stables.push(job)
                break
              case 'disabled':
              case 'disabled_anime':
                job.color = job.color.replace('disabled', 'disabledJob')
                this.disableds.push(job)
                break
              case 'red':
              case 'red_anime':
                this.fails.push(job)
                break
              case 'aborted':
              case 'aborted_anime':
                this.aborted.push(job)
                break
              default:
                this.unknowns.push(job)
                break
            }
          })
          if (this.interval === '') {
            this.interval = setInterval(this.loadData, 15000)
          }
        })
      }
    },
    beforeDestroy () {
      clearInterval(this.interval)
    }
  }
</script>

<style>

	.aborted_anime,.anime,.blue_anime,.notbuilt_anime,.red_anime,.yellow_anime {
	-webkit-animation-name:pulse_animation;-webkit-animation-duration:2000ms;-webkit-transform-origin:70% 70%;-webkit-animation-iteration-count:infinite;-webkit-animation-timing-function:linear
}
	.aborted,.aborted_anime,.blue,.blue_anime,.disabledJob,.disabledJob_anime,.notbuilt,.notbuilt_anime,.radiator-li,.red,.red_anime,.yellow,.yellow_anime {
	border-radius:3px;border-color:#000;font-size:x-large
}
	.blue,.blue_anime {
	background-color:#006400
}
	.blue_anime {
	background-color:#2e8b57
}
	.red,.red_anime {
	background-color:#b22222;font-size:64px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap
}
	.red_anime {
	background-color:red
}
	.yellow,.yellow_anime {
	background-color:#daa520
}
	.disabledJob,.disabledJob_anime {
	background-color:#696969
}
	.disabledJob_anime {
	background-color:lightgrey
}
	.notbuilt,.notbuilt_anime {
	background-color:#000
}
	.aborted,.aborted_anime {
	background-color:darkgrey
}
	.aborted_anime {
	background-color:lightgrey
}	</style>