<template>
    <div class="container is-fluid mt-5">
        <div class="columns is-centered">
            <div class="column is-8">
                <h1 class="title">Welcome</h1>
                <p>
                    Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nemo quae
                    rem ipsum praesentium, tenetur doloremque libero. Fugit, dolore
                    possimus molestias cupiditate iste deserunt! Aut aliquid rem quas
                    consequatur non iste.
                </p>
            </div>
            <div class="column is-4">
                <h1 class="title">Sign Up</h1>
                <!-- Sign up form -->
                <div class="field">
                    <label class="label">Username</label>
                    <div class="control has-icons-left">
                        <input v-model="$v.username.$model" :class="{ 'is-danger': $v.username.$error }" class="input"
                            type="text" />
                        <span class="icon is-small is-left">
                            <i class="fas fa-user"></i>
                        </span>
                    </div>
                    <!-- <p class="help is-danger">error</p> -->
                    <template v-if="$v.username.$error">
                        <p class="help is-danger" v-if="!$v.username.required">This field is required</p>
                        <p class="help is-danger" v-if="!$v.username.maxLenght">max 20 char</p>
                        <p class="help is-danger" v-if="!$v.username.minLenght">min 5 char</p>

                    </template>
                </div>

                <div class="field">
                    <label class="label">Password</label>
                    <div class="control has-icons-left has-icons-right">
                        <input class="input" type="password" />
                        <span class="icon is-small is-left">
                            <i class="fas fa-lock"></i>
                        </span>
                    </div>
                    <p class="help is-danger">error</p>
                </div>

                <div class="field">
                    <label class="label">Confirm Password</label>
                    <div class="control has-icons-left has-icons-right">
                        <input class="input" type="password" />
                        <span class="icon is-small is-left">
                            <i class="fas fa-lock"></i>
                        </span>
                    </div>
                    <p class="help is-danger">error</p>
                </div>

                <div class="field">
                    <label class="label">Email</label>
                    <div class="control has-icons-left has-icons-right">
                        <input v-model="$v.email.$model" :class="{ 'is-danger': $v.email.$error }" class="input"
                            type="text" />
                        <span class="icon is-small is-left">
                            <i class="fas fa-envelope"></i>
                        </span>
                    </div>
                    <!-- <p class="help is-danger">error</p> -->
                    <template v-if="$v.email.$error">
                        <p class="help is-danger" v-if="!$v.email.required">This field is required</p>
                        <p class="help is-danger" v-if="!$v.email.email">Invalid Email</p>
                    </template>
                </div>

                <div class="field">
                    <label class="label">Mobile Number</label>
                    <div class="control has-icons-left has-icons-right">
                        <input v-model="$v.mobile.$model" :class="{ 'is-danger': $v.mobile.$error }" class="input"
                            type="text" />
                        <span class="icon is-small is-left">
                            <i class="fas fa-mobile"></i>
                        </span>
                    </div>
                    <!-- <p class="help is-danger">error</p> -->
                    <template v-if="$v.mobile.$error">
                        <p class="help is-danger" v-if="!$v.mobile.required">This field is required</p>
                        <p class="help is-danger" v-if="!$v.mobile.mobile">Invalid Mobile Number</p>
                    </template>
                </div>

                <div class="field">
                    <label class="label">First Name</label>
                    <div class="control has-icons-left has-icons-right">
                        <input v-model="$v.first_name.$model" :class="{ 'is-danger': $v.first_name.$error }" class="input"
                            type="text" />
                    </div>
                    <!-- <p class="help is-danger">error</p> -->
                    <template v-if="$v.first_name.$error">
                        <p class="help is-danger" v-if="!$v.first_name.required">This field is required</p>
                        <p class="help is-danger" v-if="!$v.first_name.maxLenght">must be in 150 char</p>
                    </template>
                </div>

                <div class="field">
                    <label class="label">Last Name</label>
                    <div class="control has-icons-left has-icons-right">
                        <input v-model="$v.last_name.$model" :class="{ 'is-danger': $v.last_name.$error }" class="input"
                            type="text" />
                    </div>
                    <!-- <p class="help is-danger">error</p> -->
                    <template v-if="$v.last_name.$error">
                        <p class="help is-danger" v-if="!$v.last_name.required">This field is required</p>
                        <p class="help is-danger" v-if="!$v.last_name.maxLenght">must be in 150 char</p>
                    </template>
                </div>

                <!-- <button class="button is-primary is-fullwidth">Sign Up</button> -->
                <button class="button is-primary is-fullwidth" @click="submit()">Sign Up</button>

                <p class="my-3">
                    Already have an account? <a href="#">Login</a>
                </p>
            </div>
        </div>
    </div>
</template>
     
<script>
import axios from 'axios'
// import { required, email } from 'vuelidate/lib/validators';
import { required, email, minLength, maxLength, sameAs } from 'vuelidate/lib/validators'
function mobile(value) {
    return !!value.match(/0[0-9]{9}/)
}
function complexPassword(value) {
    if (!(value.match(/[a-z]/) && value.match(/[A-Z]/) && value.match(/[0-9]/))) {
        return false
    }
    return true
}
export default {
    data() {
        return {
            username: '',
            password: '',
            confirm_password: '',
            email: '',
            mobile: '',
            first_name: '',
            last_name: ''
        }
    },
    validations: {
        username: {
            required: required,
            minLength: minLength(5),
            maxLenght: maxLength(20),
        },
        first_name: {
            required: required,
            maxLenght: maxLength(150),
        },
        last_name: {
            required: required,
            maxLenght: maxLength(150),
        },
        email: {
            required,
            email
        },
        mobile: {
            required: required,
            mobile: mobile
        },
        password: {
            required: required,
            minLength: minLength(8),
            complex: complexPassword,
        },
        confirm_password: {
            sameAs: sameAs('password'),
        },
    },
    methods: {
        submit() {
            // Validate all fields
            this.$v.$touch();

            // เช็คว่าในฟอร์มไม่มี error
            if (!this.$v.$invalid) {
                let data = {
                    username: this.username,
                    password: this.password,
                    confirm_password: this.confirm_password,
                    email: this.email,
                    mobile: this.mobile,
                    first_name: this.first_name,
                    last_name: this.last_name,
                }

                axios
                    .post("http://localhost:3000/user/signup", data)
                    .then((res) => {
                        alert("Sign up Success");
                    })
                    .catch((err) => {
                        alert(err.response.data.details.message)
                    })
            }
        },
    },
}
</script>