<template>
    <ul v-if="list.length" class="failed list-group row radiatorGroup">
        <radiator-job v-for="job in orderedJobs(list)" :job="job" :key="job.name"/>
    </ul>
</template>

<script>
import RadiatorJob from '@/components/RadiatorJob'
export default {
  name: 'radiator-group',
  data () {
    return {}
  },
  components: {
    RadiatorJob
  },
  props: {
    list() {
      return {
      type: Array,
      default: []}
      }
  },
  methods: {
    orderedJobs () {
      return this._.orderBy(this.list, ['lastBuild.timestamp'], ['desc'])
    }
  }
}
</script>

<style>
	.radiatorGroup {
	padding:0 15px
}
@-webkit-keyframes pulse_animation {
	0%,30% {
	-webkit-transform:scale(1)
}
	40% {
	-webkit-transform:scale(1.08)
}
	50%,60% {
	-webkit-transform:scale(1)
}
	70% {
	-webkit-transform:scale(1.05)
}
	100%,80% {
	-webkit-transform:scale(1)
}}
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
}	
</style>


