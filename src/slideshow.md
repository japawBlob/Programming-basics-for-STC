---
marp: true
theme: gaia
_class: lead
style: |
  section {
    font-family: 'Cascadia Code', monospace;
    color: #d0d0d0;
  }
  code {
   font-family: 'Roboto Mono', monospace;
  }
  h1 {
    color: #AA791D;
  }
  a {
   color: gray;
  }
  h2 {
    font-size: 1.1rem;
    color: #AA791D;
  }
  li{
    font-size: 0.9rem;
  }
  ul {
    margin: 0;
  }
  footer a {
   color: gray;
   font-size: .5rem;
  }
  header {
   font-size: .5rem;
   color: grey;
  }

  /* Styling page number */
  section::after {
    color: grey;
    font-weight: bold;
    font-size: 1.5 rem;
  }
paginate: true
backgroundColor: "#252525"
size: 16:9
---
<!--
header: ''
footer: ''
paginate: false
-->

<!--#
Co budeme probírat? Nebudu Vás učit jak vypadá for cyklus, ale trochu bych s Váma chtěl projít problematiku toho, proč nemáme jen jeden programovací jazyk. 

Nechci z Vás udělat programátory, ale spíš Vám dát nějakej rozhled ohledně toho, co se vlastně děje, a kdybyste se s programátorama bavili, tak ať jim aspoň trochu rozumíte - Alza story
-->

# Programming basics for STC

---

# Who am I?
<!--
header: 'Programming basics for STC'
footer: '[japawBlob/Programming-basics-for-STC](https://github.com/japawBlob/Programming-basics-for-STC)'
paginate: true
-->

Jakub Jíra - STC 2016-2018 
CTU FEE - OI, Computer Engeneering
[github.com/japawBlob](https://github.com/japawBlob)
![bg right:27% 100%](../assets/me.png)
## What I like?

low-level programming
embedded systems
Open source
Beer

---

# Who am I?

Jakub Jíra - STC 2016-2018 
CTU FEE / ČVUT FEL - OI
[github.com/japawBlob](https://github.com/japawBlob)
![bg right:27% 100%](../assets/me.png)

<!--
# Systems languages:
Programovací jazyky, které se používají na operační systémy, low-level embedded věci. C, C++, Rust, Zig (nový populární jazyk - pořád v betě, ale vypadá zajímavě)

# Computer architectures 
mám solidní základy o tom, jak se to vlastně stane, že se instrukce vykoná na počítači. Ne tolik elektronický základ, ale spíše logický. 

# Počítačové a komunikační sítě - spíše ty počítačové, než komunikační, ale určitě jsem schopen dodat inside to algorytmů, podle kterých se směruje celý internet a podobně. 

# Linux 
jsem linux uživatel - žádný turbo poweruser - nepoužívám VIM. Ale mám rád ideu linuxu a úplně se mi nelíbí směr, kterým se dává Windows, a jako velký bonus - linux je open source. A taky vyvíjet něco na windows je pain.
-->


## What I ***can*** give you inside about?

Systems languages
Computer architectures
Computer and Communication networks
Linux

---

# Who am I?

Jakub Jíra - STC 2016-2018 
CTU FEE / ČVUT FEL - OI
[github.com/japawBlob](https://github.com/japawBlob)
![bg right:27% 100%](../assets/me.png)

<!--
# C#
a obecně vývoj na windows. Nikdy jsem pořádně nic nenapsal, aby to bylo cíleně určené pro windows. Obecně microsoft technologie se mi dost minuly, mám zkušenosti s Powershellem - ale to je prostě shell. 

# Web developement
Důležitý zmínit, protože jedna z věcí, o které budu dneska mluvit se hodně týká webu, takže je možné, že budu mít zásadní nedostatky. Nikdy jsem nehrábnul na JavaScript, TypeScript. 

# ??? 
A pár otazníčků na konec, protože jsem si jistý, že během přednášky přijdeme na něco, co fakt nebudu znát, takže to tu předem uvádím, abyste věděli rovnou, že to přijde:)

-->

## What I ***can't*** give you inside about?

C#
Web developement
???

---


# Raw structure of lecture

<!--
# Krátká historie - proč máme vlastě tolik programovacích jazyků, co stálo za jejich vznikem. Nejsem nijak extra expert na historii, ale provedu Vás tím, ať máte základ aspoň jako já.

Abstrakce - v programování něco žádoucího.
-->

0) Introduction
1) Quick history
   From different architectures to unified code.
2) Current technologies in use
    New methods and techniques in use and developement.
3) Future?
4) Freestyle!

---

# How does computer work? 

<!--
# Pro pochopení assembleru je důležité pochopit, jak vlastně procesor funguje. Má registry a s daty v registrech nějak manipuluje.

Analogie s dělníkem na žebříku.

Poučení - počítač je schopen pracovat akorát s registry a přístup do paměti je drahý. 

I assembler je nějaká forma abstrakce
-->
How does CPU manipulate data? Trough registers.

```assembly
add x0, x1, x2     # x0 = x1+x2
```

It also is abstraction - from direct code.

```
0000 0000 0010 0010 0000 0000 0010 0000
```

---

# Beginings 

<!--# note: 
Different types of assembly docela bordel.
Snaha sjednotit všechny druhy assembleru pod jeden kod.
-->
x86, RISC-V, MIPS, POWER, ARM

## Too many assemblers?

Yes, kinda

## Answer?

C (along many others)

---

# C

Is still 1:1 copy of machine code
<!--#
už můžeme vidět, že je to lidsky lepší - pořád to není úplny labůžo.

-->

```c
int main(){
  int x0 = 0, x1 = 10, x2 = 20;
  x0 = x1 + x2;
  printf("The x0 varialbe is: %d", x0);
}
```
<!--#
C hodně málo pomáhá a nedělá věci za vás - pokud chcete paměť, musíte si o ni říct operačnímu systému a pak ji zase vrátit, až ji přesatanete používat.

Nechá vás udělat spoustu věcí, které skončí nedefinovaně, nebo přímo škodlivě - bezpečnostní riziko.
-->
Not really human centric
Quite a mess in beginings

---
<!--#
Vyrobíme VM pro každou architekturu, s tím se smíříme, že to holt jinak nepůjde. Ale pak už namíšeme univerzální kód, který pojede na VM a ta se postará, aby cílový stroj dělal to, co má. 

Nutné počítat s overheadem VM.

Teorie dobrá, praxe pokulhává. 
-->
# Interpretation > Compiling

Create virtual machine for each architecture

Create code for virtual machie

Runs everywhere! -> Happy developer

---
<!--#
JavaScript defacto bere jako VM prohlížeč.
-->
# Java, C#

Code -> Bytecode -> Interpretation

Just in time compiling

Virtual machine for interpretation JVM / .NET

Garbage collection

---



# Current trends

<!--#
To by asi bylo cca k historii. Teď něco rychle k současnosti, k nějakým trendům.
-->

---

# Current trends

## Low-Code programming

Drag and drop visual interface

Pros: Fast to catch up, easy to understand

Cons: Locks you into platform, lower control

Microsoft chatbot creation...

---

<!--
# Nix package manager. 

functional approach in other languages
-->

# Current trends

## Functional programming

Describe code using pure functions

Mathematical approach

---

<!--
# zkompilujete si program a on krásně funguje ve webovce - zavolá se z javascriptu

Nejen pro web - Frostgiant a Stormgate
-->

# Current trends

## Web Assembly

Create code in *ANY* language

Faster ~~alternative~~ for JavaScript

Bytecode run in browser.

---

<!--
# zkompilujete si program a on krásně funguje ve webovce - zavolá se z javascriptu

Nejen pro web - Frostgiant a Stormgate
-->

# Current trends

## Systems programming languages

Rust

Zig

Carbon

---

# Future?

AI will take over everything

All hail to our AI overlords!

---

# Freestyle!

Thanks!