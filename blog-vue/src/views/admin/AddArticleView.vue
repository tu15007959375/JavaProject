<template>
    <div style="text-align: left;">
        <h1 style="color: black;text-align: center;margin-top: 0px;">编辑文章&nbsp;&nbsp;&nbsp;&nbsp;{{title}}</h1>
        <br>
        <MdEditor v-if="initSuccess" :content="text" :title="title"></MdEditor>

    </div>
</template>

<script>
    export default {

        data() {
            return {
                initSuccess: false,
                text: '',
                title: '',
            }
        },
        created() {
            this.init()

            console.log(this.text);
        },
        methods: {
            async init() {

                let str = this.$route.params.title
                this.title = this.$route.params.title
                if (str != null && str != '') {
                    str += '.md'
                    await this.$axios.get('/mymd/' + str)
                        .then(response => {
                            this.text = response.data;
                        })
                        .catch(error => {
                            console.error('读取文件失败:', error);
                        });

                }
                this.initSuccess = true
            },
        }
    }
</script>

<style scoped>
</style>