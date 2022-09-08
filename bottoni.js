//BOTTTONI PER EVIDENZIARE I TERMINI E BOTTONE TERMINOLOGIA

//per selezionare i nodi html query selctor con class creata in xsl
const corr = document.querySelector("#correzioni");
const orig = document.querySelectorAll(".orig");
const reg = document.querySelectorAll(".reg");

const glott = document.querySelector("#glottonimo");
const lang = document.querySelectorAll(".lang");

const cancel = document.querySelector("#cancellazione");
const del = document.querySelectorAll(".del");
const gap = document.querySelectorAll(".gap");

const agg = document.querySelector("#aggiunte");
const supplied = document.querySelectorAll(".supplied");

const topo = document.querySelector("#toponimo");
//name che sarebbe il tag di toponimo non è utilizzabile perché è una costannte
const toponimi = document.querySelectorAll(".toponimo");

const termi = document.querySelector("#termine");
const terms = document.querySelectorAll(".terms");

const abb = document.querySelector("#abbreviazione");
const abbr = document.querySelectorAll(".abbr");
const expan = document.querySelectorAll(".expan");

const appendi =document.querySelector ("#terminologia");
const gloss = document.querySelectorAll (".gloss");
const label = document.querySelectorAll(".label");


corr.addEventListener("click", () => {
    orig.forEach(scelta => scelta.classList.toggle("none"));
    reg.forEach(estensione => estensione.classList.toggle("inline_block"));
})

glott.addEventListener("click", () => {
    lang.forEach(ln => ln.classList.toggle("green"));
})

cancel.addEventListener("click", () => {
    del.forEach(canc => canc.classList.toggle("line_through"));
    gap.forEach(vuota => vuota.classList.toggle("none"));
})

agg.addEventListener("click", () => {
    supplied.forEach(suppl => suppl.classList.toggle("purple"));
})


topo.addEventListener("click", () => {
    toponimi.forEach(nomi => nomi.classList.toggle("bordeaux"));
})

termi.addEventListener("click", () => {
    terms.forEach(termini => termini.classList.toggle("yellow"));
})

abb.addEventListener("click", () => {
    abbr.forEach(abbre => abbre.classList.toggle("none"));
    expan.forEach(expans => expans.classList.toggle("inline_block"));
})

appendi.addEventListener("click", () =>{
    gloss.forEach(vocabolario => vocabolario.classList.toggle("inline_block")); 
    label.forEach(aggiungi => aggiungi.classList.toggle("inline_block"));
})



