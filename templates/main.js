light = 1

function change_theme() {
    if(light == 1){
        document.body.style.background = "#232323"
        light = 0;
    }
    else{
        document.body.style.background = "#D9D9D9"
        light = 1;
    }

}

let theme_button = document.querySelector('.top-icon')
theme_button.addEventListener('click', change_theme)