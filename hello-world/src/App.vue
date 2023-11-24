<template>
    <div>
        <div>
            <button v-on:click="addLike">Like</button>
        </div>
        <div><strong>Кол-во лайков:</strong> {{ likes }}</div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            likes: 0,
            
        }
    },
    methods: {
        addLike() {
            this.likes += 10000;
        }
    }
}
</script>

<style>

</style>