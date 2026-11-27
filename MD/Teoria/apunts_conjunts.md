
# Conjunts i combinatòria — Apunts

**Objectiu:** recollir la teoria bàsica de conjunts, cardinalitat, inclusió-exclusió, coeficients binomials, binomi de Newton, doble comptatge i les eines necessàries per resoldre la Llista 1 — Conjunts.

## Índex

- [[#0. Convencions i notació]]
- [[#1. Conjunts: definicions bàsiques]]
- [[#2. Operacions amb conjunts]]
- [[#3. Cardinalitat i principis bàsics]]
- [[#4. Inclusió-exclusió]]
- [[#5. Producte cartesià]]
- [[#6. Subconjunts i funció característica]]
- [[#7. Coeficient binomial]]
- [[#8. Binomi de Newton i conseqüències]]
- [[#9. Desarranjaments i surjeccions]]
- [[#10. Doble comptatge]]
- [[#11. Mètodes per demostrar identitats]]
- [[#12. Errors típics i confusions]]
- [[#13. Pistes per a la Llista 1]]
- [[#14. Resum de fórmules]]
- [[#15. Checklist]]

---

## 0. Convencions i notació

**Notació:**

- $[n]=\{1,2,\dots,n\}$.
- $\binom{n}{k}=C(n,k)$ és el coeficient binomial.
- Convenim que $\binom{n}{k}=0$ si $k<0$ o $k>n$.
- $\mathbb{N}$ pot incloure el $0$ o no. Cal mirar què fa servir el curs. Al problema $2x+3y\le 7$, si $\mathbb{N}=\{0,1,2,\dots\}$, hi ha solucions amb $x=0$ o $y=0$. Si $\mathbb{N}=\{1,2,\dots\}$, canvien els resultats.
- En matemàtiques, “o” normalment és inclusiu: $A\cup B$ vol dir a $A$, a $B$, o a tots dos.

**Errada OCR del PDF:** al PDF apareix $A\in B$ per indicar inclusió. La notació correcta és

$$
A\subseteq B \quad\Longleftrightarrow\quad \forall e,\ e\in A\Rightarrow e\in B.
$$

El símbol $\in$ és entre element i conjunt; $\subseteq$ és entre conjunts.

---

## 1. Conjunts: definicions bàsiques

**Definició.** Un conjunt és una col·lecció d’elements distinctes. Escrivim

$$
e\in C
$$

per dir que $e$ pertany a $C$, i

$$
e\notin C
$$

per dir que no hi pertany.

**Definició.** El conjunt buit és

$$
\emptyset=\{\}.
$$

**Definició.** Inclusió:

$$
A\subseteq B \quad\Longleftrightarrow\quad (e\in A\Rightarrow e\in B).
$$

Es llegeix “$A$ està inclòs en $B$” o “$A$ és un subconjunt de $B$”.

Igualtat de conjunts:

$$
A=B \quad\Longleftrightarrow\quad A\subseteq B\ \text{i}\ B\subseteq A.
$$

### 1.1 Formes de definir un conjunt

**Per extensió:** es llisten tots els elements:

$$
\{1,3,5\},\qquad \{1,2,3,\dots,1000\},\qquad \{1,3,5,7,9,\dots\}.
$$

**Per comprensió:** es descriuen els elements amb una propietat:

$$
A=\{x\in X\mid P(x)\}
$$

o, més generalment,

$$
A=\{f(x)\mid x\in X,\ P(x)\}.
$$

Aquí $X$ és el conjunt on varien les $x$, $P(x)$ és una propietat i $f(x)$ és l’expressió dels elements.

**Exemple:**

$$
\{n\in\mathbb{N}\mid n\text{ és parell}\},\qquad
\{2n\mid n\in\mathbb{N}\}.
$$

---

## 2. Operacions amb conjunts

**Unió:**

$$
A\cup B=\{e\mid e\in A\ \text{o}\ e\in B\}.
$$

**Intersecció:**

$$
A\cap B=\{e\mid e\in A\ \text{i}\ e\in B\}.
$$

**Diferència:**

$$
A\setminus B=\{e\mid e\in A\ \text{i}\ e\notin B\}.
$$

**Atenció:** al PDF original falta el $\notin$ per error tipogràfic.

**Complementari:** si $U$ és el conjunt universal i $A\subseteq U$,

$$
A^c=U\setminus A.
$$

### 2.1 Propietats

Siguin $A,B,C$ conjunts.

**Associatives:**

$$
A\cup(B\cup C)=(A\cup B)\cup C,
$$

$$
A\cap(B\cap C)=(A\cap B)\cap C.
$$

**Commutatives:**

$$
A\cup B=B\cup A,\qquad A\cap B=B\cap A.
$$

**Distributives:**

$$
A\cup(B\cap C)=(A\cup B)\cap(A\cup C),
$$

$$
A\cap(B\cup C)=(A\cap B)\cup(A\cap C).
$$

**Idempotència:**

$$
A\cup A=A,\qquad A\cap A=A.
$$

**De Morgan per a diferències:**

$$
A\setminus(B\cup C)=(A\setminus B)\cap(A\setminus C),
$$

$$
A\setminus(B\cap C)=(A\setminus B)\cup(A\setminus C).
$$

Al PDF original la primera línia apareix amb $\cup$ per error. Unió dins de la diferència dona intersecció de diferències.

**De Morgan per complements:**

$$
(A\cup B)^c=A^c\cap B^c,
$$

$$
(A\cap B)^c=A^c\cup B^c.
$$

**Error típic:** $A\setminus B\neq B\setminus A$ en general. La diferència no és commutativa.

Exemple: $A=\{1,2\}$, $B=\{2,3\}$:

$$
A\setminus B=\{1\},\qquad B\setminus A=\{3\}.
$$

---

## 3. Cardinalitat i principis bàsics

**Definició.** La cardinalitat d’un conjunt finit $C$ és el nombre d’elements:

$$
\lvert C\rvert=\operatorname{card}(C).
$$

Exemples:

$$
\lvert\{1,3,5\}\rvert=3,
$$

$$
\lvert\{1,3,5,7,9,\dots\}\rvert=\infty.
$$

Es pot escriure $\lvert\mathbb{N}\rvert=\aleph_0$ i $\lvert\mathbb{R}\rvert>\aleph_0$, però per a la Llista 1 només calen conjunts finits.

### 3.1 Principi additiu

Si $A\cap B=\emptyset$, aleshores

$$
\lvert A\cup B\rvert=\lvert A\rvert+\lvert B\rvert.
$$

Més generalment, si $A_1,\dots,A_n$ són disjunts dos a dos:

$$
\left\lvert\bigcup_{i=1}^n A_i\right\rvert=\sum_{i=1}^n \lvert A_i\rvert.
$$

**Quan no són disjunts:** si $A\cap B\neq\emptyset$, no és cert que $\lvert A\cup B\rvert=\lvert A\rvert+\lvert B\rvert$. Cal restar la intersecció:

$$
\lvert A\cup B\rvert=\lvert A\rvert+\lvert B\rvert-\lvert A\cap B\rvert.
$$

### 3.2 Principi multiplicatiu

$$
\lvert A\times B\rvert=\lvert A\rvert\cdot \lvert B\rvert.
$$

Si una elecció es fa en diverses etapes independents i hi ha $a_1,a_2,\dots,a_r$ possibilitats a cada etapa, el nombre total és

$$
a_1a_2\cdots a_r.
$$

**Exemple: cadenes de zeros i uns.** El nombre de cadenes de longitud $n$ amb símbols $\{0,1\}$ és

$$
2^n.
$$

Si exigim exactament $k$ zeros, cal triar les posicions dels zeros:

$$
\binom{n}{k}.
$$

**Exemple: daus.** Nombre de seqüències de $n$ llançaments d’un dau de $k$ cares:

$$
k^n.
$$

Nombre de seqüències amb almenys un $6$:

$$
k^n-(k-1)^n
$$

si una de les cares és el $6$. Equivalentment, complementari de “cap 6”.

**Exemple: zeros al final de $2026!$.** El nombre de zeros al final de $n!$ és

$$
v_5(n!)=\sum_{j\ge1}\left\lfloor\frac{n}{5^j}\right\rfloor,
$$

perquè hi ha més factors $2$ que factors $5$. Per a $2026$:

$$
\left\lfloor\frac{2026}{5}\right\rfloor+
\left\lfloor\frac{2026}{25}\right\rfloor+
\left\lfloor\frac{2026}{125}\right\rfloor+
\left\lfloor\frac{2026}{625}\right\rfloor
=405+81+16+3=505.
$$

---

## 4. Inclusió-exclusió

**Dues parts:**

$$
\lvert A\cup B\rvert=\lvert A\rvert+\lvert B\rvert-\lvert A\cap B\rvert.
$$

**Tres parts:**

$$
\begin{aligned}
\lvert A\cup B\cup C\rvert={}&\lvert A\rvert+\lvert B\rvert+\lvert C\rvert\\
&-\lvert A\cap B\rvert-\lvert A\cap C\rvert-\lvert B\cap C\rvert\\
&+\lvert A\cap B\cap C\rvert.
\end{aligned}
$$

**Fórmula general d’inclusió-exclusió.** Siguin $A_1,\dots,A_n$ conjunts finits. Aleshores

$$
\left\lvert\bigcup_{i=1}^n A_i\right\rvert
=
\sum_{\emptyset\neq R\subseteq[n]}
(-1)^{\lvert R\rvert+1}
\left\lvert\bigcap_{r\in R}A_r\right\rvert.
$$

Equivalentment:

$$
\left\lvert\bigcup_{i=1}^n A_i\right\rvert
=
\sum_{s=1}^n(-1)^{s+1}
\sum_{1\le i_1<\cdots<i_s\le n}
\lvert A_{i_1}\cap\cdots\cap A_{i_s}\rvert.
$$

Signes: $+$ per als individus, $-$ per a les parelles, $+$ per a les ternes, $-$ per a les quàdruples, etc.

**Error habitual:** equivocar-se en els signes. Regla mnemotècnica:

$$
+,-,+,-,+,\dots
$$

començant per la suma dels tamanys individuals.

**Demostració de la fórmula general.** Es pot fer per inducció sobre $n$. Base $n=1$ trivial. Pas inductiu:

$$
\left\lvert\bigcup_{i=1}^{n+1}A_i\right\rvert
=
\left\lvert\bigcup_{i=1}^{n}A_i\right\rvert+\lvert A_{n+1}\rvert
-
\left\lvert\left(\bigcup_{i=1}^{n}A_i\right)\cap A_{n+1}\right\rvert.
$$

S’aplica la hipòtesi d’inducció al primer terme i també a la unió

$$
\bigcup_{i=1}^{n}(A_i\cap A_{n+1}),
$$

i en agrupar els termes s’obté exactament l’alternança de signes.

**Exemple: problema 7.** En una classe de 67 estudiants, 41 saben anglès, 20 francès i 10 ambdues llengües. Els que saben almenys una llengua són

$$
41+20-10=51.
$$

Per tant, no saben cap de les dues:

$$
67-51=16.
$$

Amb rus: si 12 parlen rus, 7 anglès, 5 francès i 3 les tres, la unió de les tres llengües és

$$
41+20+12-10-7-5+3=54.
$$

No parlen cap de les tres:

$$
67-54=13.
$$

---

## 5. Producte cartesià

**Definició:**

$$
A\times B=\{(a,b)\mid a\in A,\ b\in B\}.
$$

Els elements són parells ordenats: $(a,b)\neq(b,a)$ en general.

**Exemple corregit.** Si $A=\{1,2\}$ i $B=\{x,y\}$, aleshores

$$
A\times B=\{(1,x),(1,y),(2,x),(2,y)\}.
$$

**Teorema.** Si $A$ i $B$ són finits:

$$
\lvert A\times B\rvert=\lvert A\rvert\cdot\lvert B\rvert.
$$

---

## 6. Subconjunts i funció característica

**Conjunt de parts:**

$$
\mathcal{P}(C)=\{D\mid D\subseteq C\}.
$$

És el conjunt de tots els subconjunts de $C$.

**Funció característica.** Per a $D\subseteq C$, la funció característica de $D$ és

$$
\mathbf{1}_D:C\to\{0,1\},
$$

$$
\mathbf{1}_D(e)=
\begin{cases}
1, & \text{si } e\in D,\\
0, & \text{si } e\notin D.
\end{cases}
$$

**Teorema.** Si $C$ és finit,

$$
\lvert\mathcal{P}(C)\rvert=2^{\lvert C\rvert}.
$$

**Demostració.** Cada element $c\in C$ té dues possibilitats: ser-hi o no ser-hi al subconjunt. Com que hi ha $\lvert C\rvert$ elements i les decisions són independents, el nombre total és

$$
\underbrace{2\cdot2\cdots2}_{\lvert C\rvert\ \text{vegades}}=2^{\lvert C\rvert}.
$$

Equivalentment, cada subconjunt correspon a una funció característica $C\to\{0,1\}$, i n’hi ha $2^{\lvert C\rvert}$.

**Exemple: problema 17.** Volem comptar

$$
\{(A,B)\mid A\subseteq B\subseteq[n]\}.
$$

Per a cada element $i\in[n]$ hi ha tres possibilitats:

1. $i\notin B$ i per tant $i\notin A$;
2. $i\in B$ però $i\notin A$;
3. $i\in A$ i per tant $i\in B$.

Així doncs, el nombre total és

$$
3^n.
$$

---

## 7. Coeficient binomial

**Definició:**

$$
\binom{n}{k}
=
\left\lvert\{D\subseteq[n]\mid \lvert D\rvert=k\}\right\rvert
=
\frac{n!}{k!(n-k)!}.
$$

És el nombre de maneres de triar $k$ elements d’un conjunt de $n$ elements, sense ordre i sense repetició.

**Exemples:**

$$
\binom{n}{0}=1,\qquad
\binom{n}{1}=n,\qquad
\binom{n}{2}=\frac{n(n-1)}{2}.
$$

**No confondre:**

$$
\binom{n}{k}
$$

és triar sense ordre. Si l’ordre importa, el nombre és

$$
\frac{n!}{(n-k)!}=k!\binom{n}{k}.
$$

Si hi ha repetició, no és $\binom{n}{k}$.

### 7.1 Propietats bàsiques

**Simetria:**

$$
\binom{n}{k}=\binom{n}{n-k}.
$$

**Absorció / increment:**

$$
k\binom{n}{k}=n\binom{n-1}{k-1}.
$$

**Recurrència de Pascal:**

$$
\binom{n}{k}=\binom{n-1}{k-1}+\binom{n-1}{k}.
$$

**Suma:**

$$
\sum_{k=0}^{n}\binom{n}{k}=2^n.
$$

**Demostració combinatòria de Pascal.** Per triar $k$ elements de $[n]$, fixem l’element $n$. O bé no el triem —llavors triem $k$ elements de $[n-1]$, $\binom{n-1}{k}$— o bé sí que el triem —llavors triem $k-1$ elements de $[n-1]$, $\binom{n-1}{k-1}$. Sumant:

$$
\binom{n}{k}=\binom{n-1}{k}+\binom{n-1}{k-1}.
$$

**Demostració de $\sum_k\binom{n}{k}=2^n$.** Cada subconjunt de $[n]$ té una mida $k$. Sumant sobre totes les mides:

$$
\sum_{k=0}^{n}\binom{n}{k}=\lvert\mathcal{P}([n])\rvert=2^n.
$$

### 7.2 Identitats útils de la Llista 1

$$
\binom{n}{k}\binom{k}{\ell}
=
\binom{n}{\ell}\binom{n-\ell}{k-\ell}.
$$

$$
\sum_{k=\ell}^{n}\binom{n}{k}\binom{k}{\ell}
=
2^{n-\ell}\binom{n}{\ell}.
$$

$$
\sum_{\ell=0}^{k}\binom{n}{\ell}\binom{n-\ell}{k-\ell}
=
2^k\binom{n}{k}.
$$

$$
\sum_{k=0}^{n}k\binom{n}{k}=n2^{n-1}.
$$

$$
\sum_{k=0}^{n}k(k-1)\binom{n}{k}=n(n-1)2^{n-2}.
$$

En general:

$$
\sum_{k=0}^{n}k(k-1)\cdots(k-\ell)\binom{n}{k}
=
n(n-1)\cdots(n-\ell)2^{n-\ell-1}.
$$

**Idea de $\sum k\binom{n}{k}$.** Es pot fer amb la derivada de $(1+x)^n$:

$$
\frac{d}{dx}(1+x)^n=n(1+x)^{n-1}
=
\sum_{k=0}^{n}k\binom{n}{k}x^{k-1}.
$$

Posant $x=1$:

$$
\sum_{k=0}^{n}k\binom{n}{k}=n2^{n-1}.
$$

També es pot fer per doble comptatge: comptar parelles $(S,x)$ amb $S\subseteq[n]$, $x\in S$.

**Fórmula de Pascal iterada / pal d’hoquei:**

$$
\sum_{\ell=0}^{n-k}\binom{n-\ell-1}{k-1}=\binom{n}{k}.
$$

Forma equivalent habitual:

$$
\sum_{i=k}^{n}\binom{i}{k}=\binom{n+1}{k+1}.
$$

**Identitat de Vandermonde:**

$$
\sum_{k=0}^{\ell}\binom{p}{k}\binom{q}{\ell-k}
=
\binom{p+q}{\ell}.
$$

En particular:

$$
\sum_{k=0}^{n}\binom{n}{k}^2=\binom{2n}{n}.
$$

**Possible errada a la Llista 1:** al problema 21.2 apareix

$$
\sum_{k=2}^{n}\binom{n}{k}=\binom{2n}{n},
$$

que no és cert en general. La identitat correcta és

$$
\sum_{k=0}^{n}\binom{n}{k}^2=\binom{2n}{n}.
$$

**Altres identitats de la Llista 1:**

$$
\sum_{k=0}^{n}k\binom{n}{k}^2
=
n\binom{2n-1}{n-1}.
$$

$$
\sum_{k=0}^{n}k(n-k)\binom{n}{k}^2
=
n^2\binom{2n-2}{n-2}.
$$

$$
\sum_{k=0}^{n}k^2\binom{n}{k}^2
=
n^2\binom{2n-2}{n-1}.
$$

**Idea per a $\sum k^2\binom{n}{k}^2$.** Usa $k\binom{n}{k}=n\binom{n-1}{k-1}$:

$$
k^2\binom{n}{k}^2
=
n^2\binom{n-1}{k-1}^2.
$$

Sumant i canviant $j=k-1$:

$$
\sum_{k=1}^{n}k^2\binom{n}{k}^2
=
n^2\sum_{j=0}^{n-1}\binom{n-1}{j}^2
=
n^2\binom{2n-2}{n-1}.
$$

---

## 8. Binomi de Newton i conseqüències

**Binomi de Newton.** Per a variables commutatives $x,y$:

$$
(x+y)^n=\sum_{k=0}^{n}\binom{n}{k}x^k y^{n-k}.
$$

**Idea combinatòria.** En desenvolupar $(x+y)^n$ triem $x$ o $y$ a cada factor. Si triem $x$ exactament $k$ vegades, apareix $x^k y^{n-k}$. El nombre de maneres de triar quins $k$ factors aporten $x$ és $\binom{n}{k}$.

**Conseqüències:**

$$
(x+1)^n=\sum_{k=0}^{n}\binom{n}{k}x^k.
$$

Posant $x=1$:

$$
2^n=\sum_{k=0}^{n}\binom{n}{k}.
$$

Posant $x=-1$:

$$
0=\sum_{k=0}^{n}(-1)^k\binom{n}{k}.
$$

Derivant:

$$
n(x+1)^{n-1}=\sum_{k=0}^{n}k\binom{n}{k}x^{k-1}.
$$

Posant $x=1$:

$$
n2^{n-1}=\sum_{k=0}^{n}k\binom{n}{k}.
$$

**Coeficient multinomial:**

$$
(x_1+\cdots+x_r)^n
=
\sum_{k_1+\cdots+k_r=n}
\frac{n!}{k_1!\cdots k_r!}
x_1^{k_1}\cdots x_r^{k_r}.
$$

El coeficient $\frac{n!}{k_1!\cdots k_r!}$ compta les maneres de repartir $n$ posicions en grups de mides $k_1,\dots,k_r$.

**Exemple: problema 24.**

Coeficient de $x^5y^7$ en $(x+y)^{12}$:

$$
\binom{12}{5}=792.
$$

Coeficient de $x^2yz^4$ en $(x+y+z)^7$:

$$
\frac{7!}{2!\,1!\,4!}=105.
$$

---

## 9. Desarranjaments i surjeccions

### 9.1 Desarranjaments

**Definició.** Un desarranjament de $[n]$ és una permutació $\sigma$ de $[n]$ sense punts fixos:

$$
\sigma(i)\neq i\quad \forall i.
$$

Es denota $!n$ o $D_n$.

**Fórmula dels desarranjaments:**

$$
!n
=
n!\sum_{i=0}^{n}\frac{(-1)^i}{i!}.
$$

La probabilitat que una permutació aleatòria sigui un desarranjament és

$$
\frac{!n}{n!}
=
\sum_{i=0}^{n}\frac{(-1)^i}{i!}.
$$

**Demostració per inclusió-exclusió.** Siguin $A_i=\{\sigma\mid \sigma(i)=i\}$. Volem

$$
n!-\left\lvert\bigcup_{i=1}^{n}A_i\right\rvert.
$$

Si $S\subseteq[n]$, $\lvert S\rvert=s$, les permutacions que fixen tots els elements de $S$ són $(n-s)!$. Per inclusió-exclusió:

$$
!n
=
\sum_{s=0}^{n}(-1)^s\binom{n}{s}(n-s)!
=
n!\sum_{s=0}^{n}\frac{(-1)^s}{s!}.
$$

**Exemple.** Per a $n=3$, els desarranjaments són $231$ i $312$, per tant $!3=2$. La fórmula dona

$$
3!\left(1-1+\frac12-\frac16\right)=6\cdot\frac13=2.
$$

### 9.2 Surjeccions

**Definició.** Una funció $f:[n]\to[k]$ és suprajectiva o surjecció si tot element de $[k]$ té almenys una preimatge:

$$
\forall y\in[k],\ \exists x\in[n]\text{ amb }f(x)=y.
$$

**Nombre de surjeccions:**

$$
\mathrm{Surj}(n,k)
=
\sum_{j=0}^{k}(-1)^j\binom{k}{j}(k-j)^n.
$$

Equivalentment:

$$
\mathrm{Surj}(n,k)=k!\,S(n,k),
$$

on $S(n,k)$ és el nombre de Stirling de segona espècie (particions de $[n]$ en $k$ blocs no buits).

**Demostració per inclusió-exclusió.** Totes les funcions $[n]\to[k]$ són $k^n$. Siguin $A_i$ les funcions que no arriben a $i$. Aleshores

$$
\mathrm{Surj}(n,k)
=
k^n-\left\lvert\bigcup_{i=1}^{k}A_i\right\rvert
=
\sum_{j=0}^{k}(-1)^j\binom{k}{j}(k-j)^n.
$$

---

## 10. Doble comptatge

**Fórmula de doble comptatge.** Siguin $A,B$ finits i $C\subseteq A\times B$. Aleshores

$$
\lvert C\rvert
=
\sum_{a\in A}\left\lvert\{b\in B\mid (a,b)\in C\}\right\rvert
=
\sum_{b\in B}\left\lvert\{a\in A\mid (a,b)\in C\}\right\rvert.
$$

És a dir, podem comptar els parells $(a,b)\in C$ fixant primer $a$ o fixant primer $b$.

**Exemple: handshake lemma.** En una trobada, el nombre de persones que han encaixat la mà a un nombre imparell de persones és sempre parell.

Model: graf on els vèrtexs són persones i les arestes són encaixades de mans. La suma de graus és $2\lvert E\rvert$, per tant és parell. Si hi hagués un nombre imparell de vèrtexs de grau imparell, la suma de graus seria imparell. Contradicció.

**Exemple: problema 13.** 17 concursants, 9 problemes, cada problema resolt per exactament 11 concursants. Volem veure que hi ha una parella que entre els dos han resolt tots els 9 problemes.

Comptem parells $(P,\{a,b\})$ on $P$ és un problema i $a,b$ són dos concursants que no han resolt $P$. Per a cada problema, els que no l’han resolt són $17-11=6$, així que hi ha

$$
\binom{6}{2}=15
$$

parelles de no-solvers. Amb 9 problemes:

$$
9\cdot15=135.
$$

Hi ha

$$
\binom{17}{2}=136
$$

parelles de concursants en total. Si cap parella hagués resolt tots els problemes, cada parella hauria de ser no-solver d’algun problema, i el total anterior seria com a mínim $136$. Però és $135$. Contradicció. Per tant, existeix una parella que entre els dos ha resolt tots els problemes.

**Exemple: problema 14.** Si cada problema és resolt per almenys $k$ concursants, aleshores cada problema té com a màxim $c-k$ no-solvers. El nombre de parelles de no-solvers per problema és com a màxim

$$
\binom{c-k}{2}.
$$

Si no hi hagués cap parella que resolgués tots els problemes, cada una de les $\binom{c}{2}$ parelles hauria de no resoldre almenys un problema. Per tant:

$$
\binom{c}{2}\le p\binom{c-k}{2}.
$$

Aïllant:

$$
p\ge \frac{c(c-1)}{(c-k)(c-k-1)}.
$$

Per tant, si

$$
p<\frac{c(c-1)}{(c-k)(c-k-1)},
$$

hi ha una parella que resol tots els problemes.

---

## 11. Mètodes per demostrar identitats

**Estratègies:**

1. Doble comptatge: comptar el mateix objecte de dues maneres.
2. Prova combinatòria: interpretar els dos costats com a recomptes de configuracions.
3. Àlgebra amb factorials: desenvolupar $\binom{n}{k}=\frac{n!}{k!(n-k)!}$.
4. Binomi de Newton i derivades/integrals formals: útil per a sumes amb $k$.
5. Inclusió-exclusió: per a “almenys un”, “cap”, “tots”.
6. Inducció: per a fórmules generals.
7. Vandermonde i Pascal: per a sumes de productes de binomials.

**Exemple: identitat $\sum_{k=0}^n\binom{n}{k}^2=\binom{2n}{n}$.** Vandermonde amb $p=q=n$, $\ell=n$:

$$
\sum_{k=0}^{n}\binom{n}{k}\binom{n}{n-k}
=
\binom{2n}{n}.
$$

Com que $\binom{n}{n-k}=\binom{n}{k}$, surt la identitat.

**Exemple: sumes de potències.** Per a $S_p(n)=\sum_{k=1}^{n}k^p$, es pot usar

$$
(n+1)^{p+1}-1
=
\sum_{q=0}^{p}\binom{p+1}{q}S_q(n).
$$

Aïllant $S_p(n)$ es troben recursivament:

$$
\sum_{k=1}^{n}1=n,
$$

$$
\sum_{k=1}^{n}k=\frac{n(n+1)}{2},
$$

$$
\sum_{k=1}^{n}k^2=\frac{n(n+1)(2n+1)}{6},
$$

$$
\sum_{k=1}^{n}k^3=\left(\frac{n(n+1)}{2}\right)^2.
$$

---

## 12. Errors típics i confusions

**Errors freqüents:**

- $\in$ vs $\subseteq$: un element pertany ($\in$); un conjunt està inclòs ($\subseteq$).
- $A\setminus B$: és “elements de $A$ que no són a $B$”. No és commutatiu.
- De Morgan amb diferències: $A\setminus(B\cup C)=(A\setminus B)\cap(A\setminus C)$. Unió dins → intersecció fora.
- $\lvert A\cup B\rvert$: no és $\lvert A\rvert+\lvert B\rvert$ si hi ha intersecció; cal restar $\lvert A\cap B\rvert$.
- Inclusió-exclusió: els signes alternen. No oblidar les interseccions múltiples.
- Producte cartesià: els parells són ordenats. $A\times B\neq B\times A$ en general.
- Coeficient binomial vs potència: $\binom{n}{k}$ és sense ordre i sense repetició; $n^k$ és ordenat amb repetició.
- “Almenys un”: normalment es fa pel complementari “cap”.
- $\binom{n}{k}=0$ si $k<0$ o $k>n$. No donar per fet que sempre té sentit.
- Natural inclou 0? Cal confirmar-ho. Al problema 1 de la Llista 1 afecta el recompte.
- Ordre vs no ordre: si has de comptar alineacions, paraules, seqüències, l’ordre importa; si comptes subconjunts o mans de cartes, no.
- Repetició vs no repetició: una paraula pot repetir lletres; un subconjunt no pot repetir elements.

**Errada del PDF sobre $A\in B$:** al PDF apareix $A\in B$ per inclusió. És incorrecte: ha de ser $A\subseteq B$.

**Errada del PDF sobre $A\setminus B$:** al PDF apareix $e\in A\setminus B\Leftrightarrow e\in A\text{ i }e\in B$. Falta el $\notin$: ha de ser $e\in A$ i $e\notin B$.

**Errada del PDF sobre De Morgan:** al PDF la primera línia de De Morgan per a diferències apareix amb $\cup$ on hauria d’haver-hi $\cap$. La forma correcta és la de la secció 2.

---

## 13. Pistes per a la Llista 1

Aquesta secció no dona totes les solucions, sinó l’eina principal de cada problema.

| Problema | Eina / idea |
|---|---|
| 1. $2x+3y\le7$, $x,y\in\mathbb{N}$ | Enumerar per $x$ o per $y$. Si $\mathbb{N}$ inclou 0: $x=0$: $y=0,1,2$; $x=1$: $y=0,1$; $x=2$: $y=0,1$; $x=3$: $y=0$. Total $8$. Si $\mathbb{N}=\{1,2,\dots\}$, canvieu-ho. |
| 2. Cadenes de zeros i uns de longitud $n$ | Cada posició té 2 opcions: $2^n$. |
| 3. Zeros al final de $2026!$ | Fórmula de Legendre: $\sum_{j\ge1}\lfloor2026/5^j\rfloor$. |
| 4. Almenys un 6 en $n$ llançaments de dau de $k$ cares | Complementari: $k^n-(k-1)^n$. Per a 10 llançaments de dau de 6 cares: $6^{10}-5^{10}$. |
| 5. Claus amb 8 profunditats | Cal $8^m\ge10^6$. $8^6=262144$, $8^7=2097152$, per tant $m=7$. |
| 6. Alineacions de futbol | Producte de binomials: $\binom31\binom63\binom84\binom53$. Si tots excepte porters poden jugar a qualsevol posició: $\binom31\binom{19}{10}\frac{10!}{3!4!3!}$. |
| 7. Anglès/francès/rus | Inclusió-exclusió. Sense rus: $67-(41+20-10)=16$. Amb rus: $67-(41+20+12-10-7-5+3)=13$. |
| 8. Entre 602 i 1002 no divisibles per 3,5,7 | Inclusió-exclusió sobre els que són divisibles per 3,5,7. Per comptar múltiples de $d$ en $[a,b]$: $\lfloor b/d\rfloor-\lfloor(a-1)/d\rfloor$. |
| 9. 1..10000 no divisibles per 4,5 ni quadrats | Inclusió-exclusió amb propietats “divisible per 4”, “divisible per 5”, “és quadrat”. Compte les interseccions. |
| 10. 5, 6, 7 cartes amb almenys un pal de cada | Inclusió-exclusió: $\sum_{j=0}^4(-1)^j\binom4j\binom{52-13j}{r}$. Per colors (vermell/negre): $\binom{52}{r}-2\binom{26}{r}$. |
| 11. Paraigües / desarranjaments | $!n=n!\sum_{i=0}^n(-1)^i/i!$. Probabilitat $!n/n!$. |
| 12. Paraules on apareixen totes les lletres / surjeccions | $\sum_{j=0}^k(-1)^j\binom{k}{j}(k-j)^n$. |
| 13. 17 concursants, 9 problemes, 11 resolts | Doble comptatge de parelles de no-solvers. Vegeu exemple secció 10. |
| 14. Generalització de 13 | Doble comptatge + desigualtat $\binom{c}{2}\le p\binom{c-k}{2}$. |
| 15. Cadenes amb exactament $k$ zeros | Triar posicions dels zeros: $\binom{n}{k}$. |
| 16. Loteria 10 de 50 | Probabilitat $1/\binom{50}{10}$. |
| 17. $\{(A,B)\mid A\subseteq B\subseteq[n]\}$ | Cada element té 3 estats: fora de $B$, dins de $B$ però fora de $A$, dins de $A$. Total $3^n$. |
| 18. Identitats binomials | Absorció, Vandermonde, doble comptatge. |
| 19. Sumes amb $k\binom{n}{k}$ | Derivar $(1+x)^n$ o usar $k\binom{n}{k}=n\binom{n-1}{k-1}$. |
| 20. Pascal iterada / pal d’hoquei | $\sum_{\ell=0}^{n-k}\binom{n-\ell-1}{k-1}=\binom{n}{k}$. |
| 21. Vandermonde i $\sum\binom{n}{k}^2$ | Vandermonde amb $p=q=n$. Compte: al PDF hi ha una possible errada a l’apartat 2. |
| 22. Sumes amb $k\binom{n}{k}^2$ | Usar $k\binom{n}{k}=n\binom{n-1}{k-1}$ i Vandermonde. Per a $\sum k^2\binom{n}{k}^2$: $n^2\binom{2n-2}{n-1}$. |
| 23. Sumes de binomials parells i ponderades | $(1+1)^n$, $(1-1)^n$ i derivades. |
| 24. Coeficients de polinomis | Binomi de Newton i multinomial. |

---

## 14. Resum de fórmules

**Conjunts:**

$$
A\cup B,\quad A\cap B,\quad A\setminus B,\quad A\times B.
$$

$$
A\setminus(B\cup C)=(A\setminus B)\cap(A\setminus C),
$$

$$
A\setminus(B\cap C)=(A\setminus B)\cup(A\setminus C).
$$

**Cardinalitat:**

$$
\lvert A\cup B\rvert=\lvert A\rvert+\lvert B\rvert-\lvert A\cap B\rvert.
$$

$$
\begin{aligned}
\lvert A\cup B\cup C\rvert={}&\lvert A\rvert+\lvert B\rvert+\lvert C\rvert\\
&-\lvert A\cap B\rvert-\lvert A\cap C\rvert-\lvert B\cap C\rvert\\
&+\lvert A\cap B\cap C\rvert.
\end{aligned}
$$

$$
\left\lvert\bigcup_{i=1}^n A_i\right\rvert
=
\sum_{\emptyset\neq R\subseteq[n]}
(-1)^{\lvert R\rvert+1}
\left\lvert\bigcap_{r\in R}A_r\right\rvert.
$$

$$
\lvert A\times B\rvert=\lvert A\rvert\lvert B\rvert.
$$

**Binomials:**

$$
\binom{n}{k}=\frac{n!}{k!(n-k)!}.
$$

$$
\binom{n}{k}=\binom{n}{n-k}.
$$

$$
k\binom{n}{k}=n\binom{n-1}{k-1}.
$$

$$
\binom{n}{k}=\binom{n-1}{k-1}+\binom{n-1}{k}.
$$

$$
\sum_{k=0}^{n}\binom{n}{k}=2^n.
$$

$$
\sum_{k=0}^{n}k\binom{n}{k}=n2^{n-1}.
$$

$$
\sum_{k=0}^{n}k(k-1)\binom{n}{k}=n(n-1)2^{n-2}.
$$

$$
\sum_{k=0}^{\ell}\binom{p}{k}\binom{q}{\ell-k}=\binom{p+q}{\ell}.
$$

$$
\sum_{k=0}^{n}\binom{n}{k}^2=\binom{2n}{n}.
$$

$$
\sum_{i=k}^{n}\binom{i}{k}=\binom{n+1}{k+1}.
$$

**Binomi:**

$$
(x+y)^n=\sum_{k=0}^{n}\binom{n}{k}x^k y^{n-k}.
$$

$$
(x_1+\cdots+x_r)^n
=
\sum_{k_1+\cdots+k_r=n}
\frac{n!}{k_1!\cdots k_r!}x_1^{k_1}\cdots x_r^{k_r}.
$$

**Desarranjaments i surjeccions:**

$$
!n=n!\sum_{i=0}^{n}\frac{(-1)^i}{i!}.
$$

$$
\mathrm{Surj}(n,k)=\sum_{j=0}^{k}(-1)^j\binom{k}{j}(k-j)^n.
$$

**Comptes bàsics.** Amb $n$ elements i triant $k$:

| | Sense repetició | Amb repetició |
|---|---|---|
| **Ordre** | $\frac{n!}{(n-k)!}$ | $n^k$ |
| **Sense ordre** | $\binom{n}{k}$ | $\binom{n+k-1}{k}$ |

---

## 15. Checklist

Abans de resoldre un problema:

- [ ] He identificat si l’ordre importa?
- [ ] Hi ha repetició?
- [ ] És “almenys un”, “cap”, “exactament”?
- [ ] Puc usar complementari?
- [ ] Puc usar inclusió-exclusió?
- [ ] Puc comptar el mateix de dues maneres?
- [ ] He comprovat els signes?
- [ ] He comprovat que $\binom{n}{k}=0$ si no té sentit?
- [ ] He tingut en compte si $\mathbb{N}$ inclou el 0?
- [ ] He distingit element ($\in$) de subconjunt ($\subseteq$)?
- [ ] He revisat les errades tipogràfiques del PDF?

---

**Idea final:** la majoria de problemes de la Llista 1 es resolen amb una combinació de:

1. principi additiu/multiplicatiu,
2. inclusió-exclusió,
3. coeficients binomials i binomi de Newton,
4. doble comptatge.

Si una identitat sembla difícil, pensa què compta cada costat abans de fer àlgebra.