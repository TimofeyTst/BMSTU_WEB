let index = 1;
let isDbNotShow = true;
let rand_mas = [77, 25, 44, 32, 12, 118, 128, 24, 136, 
    47, 144, 134, 24, 109, 97, 64, 48, 71, 2, 69, 22, 
    50, 84, 46, 56, 131, 92, 121, 90, 65, 146, 70, 8, 
    82, 137, 131, 2, 23, 65, 142, 24, 25, 32, 0, 118, 
    144, 1, 141, 137, 53]
let rand_mas_names = 
['Дуриан', 'Звёздчатое яблоко', 'Наранхилья', 'Цедра', 
'Померанец', 'Араза', 'Чалта', 'Канталупа', 'Ирга', 
'Пандан', 'Купуасу', 'Джамбу', 'Астрокариум', 'Груша', 
'Фикус', 'Джамболан', 'Воаванга', 'Сантол', 'Гранадилла', 
'Инга', 'Баккорея', 'Физалис', 'Аки', 'Кокона', 'Плумкот', 
'Помело', 'Карисса', 'Папайя', 'Сирсак', 'Виноград', 'Акебия', 
'Вампи', 'Дакриодес', 'Черёмуха', 'Арбуз', 'Папеда', 'Помелит', 
'Генипа', 'Чемпедак', 'Бойзенова ягода', 'Слива', 'Капулин', 
'Лума', 'Алыча', 'Карамбола', 'Свити', 'Ягодный мармелад', 'Сикана', 
'Тамаринд', 'Персик']

function pushFromInput() {
    let name = document.getElementById('Name').value
    let cost = document.getElementById('Cost').value
    let isName = name.match(/s/)
    let isCost = cost.match(/^\d+$/)
    console.log(isName)
    console.log(isCost)
    // if (Number.parseFloat(cost) && cost>0 && name!=""){
    //     createListElement(name, cost);
    //     document.getElementById('Name').value = '';
    //     document.getElementById('Cost').value = '';
    // } else alert("Невверный ввод")
    if (isName && isCost){
            createListElement(name, cost);
            document.getElementById('Name').value = '';
            document.getElementById('Cost').value = '';
        } else alert("Невверный ввод")
}
function createListElement(name, cost) {
    let output = document.getElementById('output');

    let div_row = document.createElement('div');
    div_row.classList.add('row');
    div_row.addEventListener('click', () => {
        div_row.remove();
        index--;
    });
    let mas = [];
    for (let i = 0; i < 3; i++) {
        mas.push(document.createElement('div'))
        mas[i].classList.add('purple-hover');
    }
    mas[0].classList.add('col-3');
    mas[1].classList.add('col-5');
    mas[2].classList.add('col-4');

    mas[0].textContent = index;
    mas[1].textContent = name;
    mas[2].textContent = cost;
    mas[2].setAttribute('id', `cost ${index++}`);
    mas.forEach(element => {
        div_row.appendChild(element);
    });
    output.appendChild(div_row);
}

function fullfil_table(id){
    if(isDbNotShow){
        isDbNotShow = false;
        let index = 0;
        

        let dbList = document.getElementById(id);

        for (let i = 0; i < 50; i++) {
            let div_row = document.createElement('div');
            div_row.classList.add('row', 'purple-hover');
            div_row.addEventListener('click', ()=>{
                div_row.classList.add('purple');
                createListElement(rand_mas_names[i], rand_mas[i]);
            });
            
            let mas = [];
            for (let i = 0; i < 3; i++) {
                mas.push(document.createElement('div'))
            }
            mas[0].classList.add('col-3');
            mas[1].classList.add('col-5');
            mas[2].classList.add('col-4');
            mas[0].textContent = `${index+1}`;
            mas[1].textContent = `${rand_mas_names[index]}`;
            mas[2].textContent = `${rand_mas[index]}`;
            mas[2].setAttribute('id', `cost ${index++}`);

            mas.forEach(element => {
                div_row.appendChild(element);
            });
            dbList.appendChild(div_row);
        }
    } else console.log('DataBase already shown');
}
function count() {
    let output = document.getElementById('output');
    let sum = 0;

    for (let i = 1; i < index; i++) {
        sum += parseInt(document.getElementById(`cost ${i}`).textContent);
    }

    let div_row = document.createElement('div');
    div_row.classList.add('row', 'purple-text');
    div_row.addEventListener('click', () => {
        div_row.remove();
    });

    let div_col_8 = document.createElement('div');
    div_col_8.classList.add('col-8');
    div_col_8.textContent = `Суммарно: `;

    let div_col_4 = document.createElement('div');
    div_col_4.classList.add('col-4');
    div_col_4.textContent = sum;


    div_row.appendChild(div_col_8);
    div_row.appendChild(div_col_4);

    output.appendChild(div_row);
    console.log(output.childNodes.length);
    console.log(sum);
}