# Apuntes Completos de Cálculo: Preliminares, Límites, Derivación e Integración

---

# Módulo 1: Preliminares, Intervalos, Desigualdades y Funciones Elementales

## 1.1 Conjuntos Numéricos e Intervalos

Los números reales ($\mathbb{R}$) se representan en la recta real y contienen los siguientes subconjuntos ordenados: $\mathbb{N} \subset \mathbb{Z} \subset \mathbb{Q} \subset \mathbb{R}$.
* **Naturales ($\mathbb{N}$):** $\{1, 2, 3, 4, \dots\}$
* **Enteros ($\mathbb{Z}$):** $\{\dots, -2, -1, 0, 1, 2, \dots\}$
* **Racionales ($\mathbb{Q}$):** $\left\{\frac{a}{b} \mid a, b \in \mathbb{Z},\ b \neq 0\right\}$ (decimales finitos o periódicos).
* **Irracionales ($\mathbb{R} \setminus \mathbb{Q}$):** Decimales infinitos no periódicos ($\sqrt{2}, \pi, e$).

### Tabla de Intervalos

| Tipo de intervalo | Notación de intervalo | Notación de desigualdad | Representación gráfica |
| :--- | :---: | :---: | :---: |
| **Abierto** | $(a, b)$ | $a < x < b$ | Extremos vacíos ($\circ \text{---} \circ$) |
| **Cerrado** | $[a, b]$ | $a \le x \le b$ | Extremos llenos ($\bullet \text{---} \bullet$) |
| **Semiabierto izq.** | $(a, b]$ | $a < x \le b$ | $\circ \text{---} \bullet$ |
| **Semiabierto der.** | $[a, b)$ | $a \le x < b$ | $\bullet \text{---} \circ$ |
| **Infinito abierto der.** | $(-\infty, b)$ | $x < b$ | $\leftarrow \text{---} \circ$ |
| **Infinito cerrado der.** | $(-\infty, b]$ | $x \le b$ | $\leftarrow \text{---} \bullet$ |
| **Infinito abierto izq.** | $(a, +\infty)$ | $x > a$ | $\circ \text{---} \rightarrow$ |
| **Infinito cerrado izq.** | $[a, +\infty)$ | $x \ge a$ | $\bullet \text{---} \rightarrow$ |
| **Recta real** | $(-\infty, +\infty)$ | $x \in \mathbb{R}$ | $\leftarrow \text{---} \rightarrow$ |

> [!note] Nota topológica
> Los intervalos de la forma $(-\infty, b]$ y $[a, +\infty)$ se consideran **cerrados**. Los extremos $-\infty$ y $+\infty$ siempre llevan paréntesis abierto.

---

## 1.2 Desigualdades y Método de la Serpiente

### Propiedades de las Desigualdades
1. **Suma/Resta:** $a < b \implies a \pm c < b \pm c$ (el sentido se mantiene).
2. **Producto/División por positivo ($c > 0$):** $a < b \implies a \cdot c < b \cdot c$ (el sentido se mantiene).
3. **Producto/División por negativo ($c < 0$):** $a < b \implies a \cdot c > b \cdot c$ (**el sentido se invierte**).
4. **Inverso:** Si $a > 0 \implies \frac{1}{a} > 0$; si $a < 0 \implies \frac{1}{a} < 0$.

> [!warning] Error común en inecuaciones racionales
> **Nunca** pases el denominador multiplicando al otro lado si contiene la incógnita $x$, ya que desconoces su signo y podrías invertir o no la desigualdad erróneamente. Pasa todo a un lado para comparar con $0$.

### Procedimiento: Método de la Serpiente (Inecuaciones polinómicas y racionales)
Permite resolver expresiones de la forma $\frac{(x-a_1)(x-a_2)\dots(x-a_n)}{(x-b_1)(x-b_2)\dots(x-b_m)} \lesseqgtr 0$.

1. **Comparar con cero:** Deja $0$ en el lado derecho.
2. **Factorizar y normalizar:** Factoriza numerador y denominador asegurando que el coeficiente de cada $x$ sea $+1$ (extrae constantes factor común y divídelas; recuerda invertir el signo si divides por un negativo).
3. **Hallar puntos críticos:**
   * Raíces del numerador ($a_i$): Se marcan con **punto lleno ($\bullet$)** si la desigualdad es no estricta ($\le, \ge$), o **punto vacío ($\circ$)** si es estricta ($<, >$).
   * Raíces del denominador ($b_j$): Se marcan **SIEMPRE con punto vacío ($\circ$)** porque anulan el denominador (no pertenecen al dominio).
4. **Trazar la curva (de derecha a izquierda):**
   * Empieza **por arriba** de la recta real a la derecha del punto crítico mayor (todos los factores son positivos).
   * Al llegar a cada punto crítico:
     * Si el factor tiene **multiplicidad impar** (exponente $1, 3, \dots$), la curva **atraviesa** la recta (cambia de signo).
     * Si el factor tiene **multiplicidad par** (exponente $2, 4, \dots$), la curva **rebota** ("brinca") y mantiene su signo.
5. **Seleccionar intervalos:** Toma las zonas por encima de la recta si buscas $>0$ ($\ge 0$) o por debajo si buscas $<0$ ($\le 0$).

> [!example] Ejemplo resuelto (Multiplicidad par)
> Resolver $\frac{(x-1)^2(x+3)}{x+1} \ge 0$.
> * Puntos críticos: $x = -3$ ($\bullet$, numerador), $x = -1$ ($\circ$, denominador), $x = 1$ ($\bullet$, numerador, multiplicidad 2).
> * De derecha a izquierda: empieza $+$ en $(1, +\infty)$; en $x=1$ rebota y sigue $+$ en $(-1, 1)$; en $x=-1$ cruza a $-$ en $(-3, -1)$; en $x=-3$ cruza a $+$ en $(-\infty, -3)$.
> * Solución ($\ge 0$): $(-\infty, -3] \cup (-1, +\infty)$ (el $1$ está incluido dentro de $(-1, +\infty)$).

> [!note] Casos cuadráticos sin raíces reales ($b^2 - 4ac < 0$)
> Si $ax^2 + bx + c = 0$ no tiene soluciones reales, la parábola no corta el eje $X$:
> * Si $a > 0 \implies ax^2 + bx + c > 0$ para todo $x \in \mathbb{R}$.
> * Si $a < 0 \implies ax^2 + bx + c < 0$ para todo $x \in \mathbb{R}$.

---

## 1.3 Valor Absoluto y Distancia

$$|x| = \begin{cases} x & \text{si } x \ge 0 \\ -x & \text{si } x < 0 \end{cases}$$

* **Interpretación geométrica:** $|x - y|$ es la distancia entre $x$ e $y$ en la recta real.
* **Propiedades clave:**
  * $|x| \ge 0$ y $|x| = |-x|$
  * $|x \cdot y| = |x| \cdot |y|$
  * **Desigualdad triangular:** $|x + y| \le |x| + |y|$
  * $|x| < d \iff -d < x < d$ (y análogo con $\le$)
  * $|x| > d \iff x < -d \text{ o } x > d$ (y análogo con $\ge$)

---

## 1.4 Funciones Elementales y Transformaciones

### Traslación de Gráficas ($C > 0$)
* $y = f(x) + C \rightarrow$ Traslación vertical $C$ unidades **hacia arriba**.
* $y = f(x) - C \rightarrow$ Traslación vertical $C$ unidades **hacia abajo**.
* $y = f(x - C) \rightarrow$ Traslación horizontal $C$ unidades **a la derecha**.
* $y = f(x + C) \rightarrow$ Traslación horizontal $C$ unidades **a la izquierda**.

### Rectas y Parábolas
* **Recta:** Pendiente $m = \frac{y_2 - y_1}{x_2 - x_1}$. Ecuación punto-pendiente: $y = m(x - x_1) + y_1$.
  * Rectas paralelas: $m_1 = m_2$.
  * Rectas perpendiculares: $m_2 = -\frac{1}{m_1}$.
* **Parábola:** $y = ax^2 + bx + c$ ($a \neq 0$).
  * Abre hacia arriba si $a > 0$, hacia abajo si $a < 0$.
  * Eje de simetría: $x = -\frac{b}{2a}$. Vértice: $\left(-\frac{b}{2a}, f\left(-\frac{b}{2a}\right)\right)$.

### Trigonometría (en Radianes)
* **Conversión:** $180^\circ = \pi \text{ rad} \implies 1^\circ = \frac{\pi}{180}\text{ rad}$, $1\text{ rad} = \frac{180^\circ}{\pi}$.
* **Arco y sector circular ($\theta$ en rad):** $l_\theta = r\theta$, $A_\theta = \frac{1}{2}r^2\theta$.
* **Identidad fundamental:** $\sin^2(\theta) + \cos^2(\theta) = 1$.
* **Dominios y recorridos:**
  * $\sin(x), \cos(x)$: Dominio $\mathbb{R}$, Imagen $[-1, 1]$, Período $2\pi$.
  * $\tan(x) = \frac{\sin(x)}{\cos(x)}$: Dominio $\mathbb{R} \setminus \left\{\frac{\pi}{2} + k\pi \mid k \in \mathbb{Z}\right\}$.

| Grados | $0^\circ$ | $30^\circ$ | $45^\circ$ | $60^\circ$ | $90^\circ$ | $120^\circ$ | $135^\circ$ | $150^\circ$ | $180^\circ$ | $270^\circ$ | $360^\circ$ |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| **Radianes** | $0$ | $\frac{\pi}{6}$ | $\frac{\pi}{4}$ | $\frac{\pi}{3}$ | $\frac{\pi}{2}$ | $\frac{2\pi}{3}$ | $\frac{3\pi}{4}$ | $\frac{5\pi}{6}$ | $\pi$ | $\frac{3\pi}{2}$ | $2\pi$ |
| $\sin(\theta)$ | $0$ | $\frac{1}{2}$ | $\frac{\sqrt{2}}{2}$ | $\frac{\sqrt{3}}{2}$ | $1$ | $\frac{\sqrt{3}}{2}$ | $\frac{\sqrt{2}}{2}$ | $\frac{1}{2}$ | $0$ | $-1$ | $0$ |
| $\cos(\theta)$ | $1$ | $\frac{\sqrt{3}}{2}$ | $\frac{\sqrt{2}}{2}$ | $\frac{1}{2}$ | $0$ | $-\frac{1}{2}$ | $-\frac{\sqrt{2}}{2}$ | $-\frac{\sqrt{3}}{2}$ | $-1$ | $0$ | $1$ |
| $\tan(\theta)$ | $0$ | $\frac{\sqrt{3}}{3}$ | $1$ | $\sqrt{3}$ | $\nexists$ | $-\sqrt{3}$ | $-1$ | $-\frac{\sqrt{3}}{3}$ | $0$ | $\nexists$ | $0$ |

### Exponenciales y Logaritmos
* **Leyes de los exponentes:** $a^n \cdot a^m = a^{n+m}$, $(a^n)^m = a^{n \cdot m}$, $(a \cdot b)^n = a^n \cdot b^n$, $a^{-n} = \frac{1}{a^n}$, $a^0 = 1$, $a^{\frac{m}{n}} = \sqrt[n]{a^m}$.
* **Función exponencial $f(x) = a^x$ ($a > 0$):** Dominio $\mathbb{R}$, Imagen $(0, +\infty)$. Creciente si $a > 1$, decreciente si $0 < a < 1$.
* **Número $e$:** $e = \lim_{n \to +\infty} \left(1 + \frac{1}{n}\right)^n \approx 2.718$. Interés compuesto continuo: $C_{final} = D \cdot e^{\frac{r}{100}}$.
* **Logaritmo neperiano $\ln(x)$:** Inversa de $e^x$ ($e^{\ln(x)} = x$ y $\ln(e^x) = x$). Dominio $(0, +\infty)$.
  * $\ln(1) = 0$
  * $\ln(x \cdot y) = \ln(x) + \ln(y)$
  * $\ln\left(\frac{x}{y}\right) = \ln(x) - \ln(y)$
  * $\ln(x^y) = y \cdot \ln(x)$

---

# Módulo 2: Límites de Funciones y Continuidad

## 2.1 Definición de Límite y Propiedades

* **Definición formal ($\epsilon - \delta$):** $\lim_{x \to x_0} f(x) = L$ si para todo $\epsilon > 0$ existe $\delta > 0$ tal que si $0 < |x - x_0| < \delta$, entonces $|f(x) - L| < \epsilon$.
* **Independencia del punto:** El límite en $x_0$ depende únicamente de los valores cercanos a $x_0$, **no** de $f(x_0)$ (ni siquiera requiere que $f(x_0)$ exista).

### Álgebra de Límites
Si $\lim_{x \to x_0} f(x) = a$ y $\lim_{x \to x_0} g(x) = b$:
* $\lim_{x \to x_0} (k \cdot f(x)) = k \cdot a$
* $\lim_{x \to x_0} (f(x) \pm g(x)) = a \pm b$
* $\lim_{x \to x_0} (f(x) \cdot g(x)) = a \cdot b$
* $\lim_{x \to x_0} \frac{f(x)}{g(x)} = \frac{a}{b}$ (siempre que $b \neq 0$)
* $\lim_{x \to x_0} (f(x))^{n/m} = a^{n/m}$ (si existe en $\mathbb{R}$)

### Teorema del Sándwich (Principio de l'Entrepà)
Si $g(x) \le f(x) \le h(x)$ en un entorno de $x_0$ y $\lim_{x \to x_0} g(x) = \lim_{x \to x_0} h(x) = L$, entonces:
$$\lim_{x \to x_0} f(x) = L$$

> [!info] Demostración clásica: $\lim_{\theta \to 0} \frac{\sin(\theta)}{\theta} = 1$
> En la circunferencia unidad para $\theta \in (0, \pi/2)$, comparamos áreas:
> $$\text{Área}(\text{sector } OAC) < \text{Área}(\triangle OAP) < \text{Área}(\text{sector } OBP)$$
> $$\frac{1}{2}\theta \cos^2(\theta) < \frac{1}{2}\cos(\theta)\sin(\theta) < \frac{1}{2}\theta$$
> Dividiendo entre $\frac{1}{2}\theta\cos(\theta)$: $\cos(\theta) < \frac{\sin(\theta)}{\theta} < \frac{1}{\cos(\theta)}$. Como los extremos tienden a $1$ cuando $\theta \to 0$, por el principio del sándwich el límite es $1$.

### Límites Laterales y Existencia
$$\exists \lim_{x \to x_0} f(x) = L \iff \lim_{x \to x_0^-} f(x) = \lim_{x \to x_0^+} f(x) = L$$
* **Cuándo NO existe un límite:**
  1. Los límites laterales existen pero son distintos (salto).
  2. La función diverge a $\pm \infty$.
  3. La función oscila indefinidamente sin acercarse a un valor (ej. $\sin(1/x)$ cuando $x \to 0$).

### Procedimientos Algebraicos para Límites
1. **Indeterminación $\frac{0}{0}$ en racionales:** Factorizar numerador y denominador (Ruffini / identidades) y cancelar el factor $(x - x_0)$.
2. **Indeterminación $\frac{0}{0}$ con raíces:** Multiplicar y dividir por el **conjugado** de la expresión con raíz.
3. **Límites al infinito ($x \to \pm \infty$) de polinomios y racionales:** Dividir numerador y denominador por la mayor potencia de $x$ del denominador (o sacar factor común el término de mayor grado), usando que $\lim_{x \to \pm\infty} \frac{1}{x^n} = 0$:
   * $\text{grado}(P) < \text{grado}(Q) \implies 0$
   * $\text{grado}(P) = \text{grado}(Q) \implies \frac{\text{coef. principal } P}{\text{coef. principal } Q}$
   * $\text{grado}(P) > \text{grado}(Q) \implies \pm\infty$ (estudiar signos)

### Asíntotas
* **Asíntota Vertical ($x = x_0$):** $\lim_{x \to x_0^-} f(x) = \pm\infty$ o $\lim_{x \to x_0^+} f(x) = \pm\infty$. (Candidatos: puntos fuera del dominio).
* **Asíntota Horizontal ($y = L$):** $\lim_{x \to +\infty} f(x) = L$ o $\lim_{x \to -\infty} f(x) = L$ ($L \in \mathbb{R}$).

---

## 2.2 Continuidad y Discontinuidades

Una función $f$ es **continua en $x_0$** si cumple tres condiciones resumidas en:
$$\lim_{x \to x_0} f(x) = f(x_0)$$
*(Es decir: existe $f(x_0)$, existe el límite finito y ambos coinciden).*

### Clasificación de Discontinuidades en $x_0$
1. **Evitable:** Existe $\lim_{x \to x_0} f(x) = L \in \mathbb{R}$, pero $f(x_0) \neq L$ o no está definida. Se repara redefiniendo $f(x_0) = L$.
2. **De salto:** Existen ambos límites laterales finitos, pero $\lim_{x \to x_0^-} f(x) \neq \lim_{x \to x_0^+} f(x)$. El salto es $\left|\lim_{x \to x_0^-} f(x) - \lim_{x \to x_0^+} f(x)\right|$.
3. **Asintótica (o de salto infinito):** Al menos uno de los límites laterales en $x_0$ es $+\infty$ o $-\infty$.
4. **De segunda especie:** Al menos uno de los límites laterales en $x_0$ **no existe** (ni siquiera como $\pm\infty$, ej. oscilación).

---

## 2.3 Teoremas Fundamentales de Continuidad

### Teorema de Bolzano
Sea $f: [a, b] \to \mathbb{R}$ **continua** en $[a, b]$ tal que $f(a) \cdot f(b) < 0$ (signos opuestos en los extremos). Entonces existe al menos un $x_0 \in (a, b)$ tal que:
$$f(x_0) = 0$$
* **Aplicación (Método de la bisección):** Permite aproximar raíces dividiendo el intervalo por su punto medio $m = \frac{a+b}{2}$ y conservando el subintervalo donde se mantiene el cambio de signo.

### Teorema de Weierstrass
Sea $f: [a, b] \to \mathbb{R}$ **continua** en un intervalo cerrado y acotado. Entonces $f$ alcanza un **máximo absoluto** y un **mínimo absoluto** en $[a, b]$: existen $\alpha, \beta \in [a, b]$ tales que $f(\alpha) \le f(x) \le f(\beta)$ para todo $x \in [a, b]$.

---

# Módulo 3: Derivación y Aplicaciones

## 3.1 Definición e Interpretación de la Derivada

La derivada de $f$ en $x_0$ se define como el límite del cociente incremental:
$$f'(x_0) = \frac{df}{dx}(x_0) = \lim_{h \to 0} \frac{f(x_0 + h) - f(x_0)}{h}$$

* **Interpretación geométrica:** $f'(x_0)$ es la **pendiente de la recta tangente** a la gráfica de $f$ en el punto $(x_0, f(x_0))$.
  * Ecuación de la recta tangente: $y = f(x_0) + f'(x_0)(x - x_0)$.
* **Interpretación física:** Si $r(t)$ es la posición, $r'(t)$ es la **velocidad instantánea**.
* **Derivabilidad y continuidad:** Toda función derivable en $x_0$ es continua en $x_0$. El recíproco es **falso**: ej. $f(x) = |x|$ es continua en $x=0$, pero no derivable porque $f'_-(0) = -1 \neq f'_+(0) = 1$ (punto anguloso).

---

## 3.2 Tabla de Derivadas y Reglas de Derivación

### Tabla de Derivadas Básicas (en radianes)

| Función $f(x)$ | Derivada $f'(x)$ | Función compuesta $f(u)$ | Derivada $f'(u) \cdot u'$ |
| :--- | :---: | :--- | :---: |
| $C$ (constante) | $0$ | $C$ | $0$ |
| $x^p$ | $p \cdot x^{p-1}$ | $u^p$ | $p \cdot u^{p-1} \cdot u'$ |
| $\sqrt{x}$ | $\frac{1}{2\sqrt{x}}$ | $\sqrt{u}$ | $\frac{u'}{2\sqrt{u}}$ |
| $\ln(x)$ | $\frac{1}{x}$ | $\ln(u)$ | $\frac{u'}{u}$ |
| $e^x$ | $e^x$ | $e^u$ | $e^u \cdot u'$ |
| $a^x$ | $a^x \cdot \ln(a)$ | $a^u$ | $a^u \cdot \ln(a) \cdot u'$ |
| $\sin(x)$ | $\cos(x)$ | $\sin(u)$ | $\cos(u) \cdot u'$ |
| $\cos(x)$ | $-\sin(x)$ | $\cos(u)$ | $-\sin(u) \cdot u'$ |
| $\tan(x)$ | $\frac{1}{\cos^2(x)} = 1 + \tan^2(x)$ | $\tan(u)$ | $\frac{u'}{\cos^2(u)}$ |

### Reglas Algebraicas de Derivación
* **Linealidad:** $(c \cdot f + d \cdot g)' = c \cdot f' + d \cdot g'$
* **Producto:** $(f \cdot g)' = f' \cdot g + f \cdot g'$
* **Cociente:** $\left(\frac{f}{g}\right)' = \frac{f' \cdot g - f \cdot g'}{g^2}$
* **Regla de la Cadena:** $(f \circ g)'(x) = f'(g(x)) \cdot g'(x)$

> [!warning] Error común: Función potencia vs. Función exponencial
> No confundas $x^\pi$ (base variable, exponente constante $\implies \pi x^{\pi-1}$) con $\pi^x$ (base constante, exponente variable $\implies \pi^x \ln(\pi)$). Si ambos tienen $x$, como $f(x)^{g(x)}$, aplica derivación logarítmica.

---

## 3.3 Teoremas del Valor Medio

### Teorema de Rolle
Sea $f: [a, b] \to \mathbb{R}$ **continua** en $[a, b]$, **derivable** en $(a, b)$ y tal que **$f(a) = f(b)$**. Entonces existe al menos un $c \in (a, b)$ tal que:
$$f'(c) = 0$$
* **Uso típico (Unicidad de raíces):** Combinado con Bolzano para demostrar que una ecuación tiene *exactamente* una raíz. Si tuviera dos ($a \neq b$ con $f(a)=f(b)=0$), por Rolle existiría $c$ con $f'(c)=0$; si $f'(x) \neq 0$ siempre, es imposible.

### Teorema del Valor Medio de Lagrange
Sea $f: [a, b] \to \mathbb{R}$ **continua** en $[a, b]$ y **derivable** en $(a, b)$. Entonces existe al menos un $c \in (a, b)$ tal que:
$$f'(c) = \frac{f(b) - f(a)}{b - a}$$
* **Interpretación geométrica:** Existe un punto intermedio cuya recta tangente es paralela a la recta secante que une los extremos.

### Consecuencias del Teorema de Lagrange (en un intervalo)
* $f'(x) = 0 \ \forall x \in (a,b) \implies f$ es constante en $[a,b]$.
* $f'(x) = g'(x) \ \forall x \in (a,b) \implies f(x) = g(x) + C$.
* $f'(x) > 0 \ \forall x \in (a,b) \implies f$ es estrictamente creciente.
* $f'(x) < 0 \ \forall x \in (a,b) \implies f$ es estrictamente decreciente.

---

## 3.4 Polinomios de Taylor y Fórmula del Resto

El **polinomio de Taylor de orden $n$** de $f$ centrado en $a$ es:
$$P_n(x) = f(a) + f'(a)(x-a) + \frac{f''(a)}{2!}(x-a)^2 + \dots + \frac{f^{(n)}(a)}{n!}(x-a)^n = \sum_{k=0}^n \frac{f^{(k)}(a)}{k!}(x-a)^k$$

### Fórmula de Taylor y Resto de Lagrange
$$f(x) = P_n(x) + R_n(x), \quad \text{donde } R_n(x) = \frac{f^{(n+1)}(c)}{(n+1)!}(x-a)^{n+1} \text{ para algún } c \text{ entre } a \text{ y } x$$

### Desarrollos de Maclaurin ($a = 0$) Imprescindibles
* $\frac{1}{1-x} = 1 + x + x^2 + x^3 + \dots + x^n + \dots$ ($|x| < 1$)
* $\frac{1}{1+x} = 1 - x + x^2 - x^3 + \dots + (-1)^n x^n + \dots$ ($|x| < 1$)
* $e^x = 1 + x + \frac{x^2}{2!} + \frac{x^3}{3!} + \dots + \frac{x^n}{n!} + \dots$ ($x \in \mathbb{R}$)
* $\sin(x) = x - \frac{x^3}{3!} + \frac{x^5}{5!} - \frac{x^7}{7!} + \dots$ ($x \in \mathbb{R}$)
* $\cos(x) = 1 - \frac{x^2}{2!} + \frac{x^4}{4!} - \frac{x^6}{6!} + \dots$ ($x \in \mathbb{R}$)
* $\ln(1+x) = x - \frac{x^2}{2} + \frac{x^3}{3} - \frac{x^4}{4} + \dots$ ($-1 < x \le 1$)

### Aplicaciones de Taylor
1. **Cálculo aproximado con cota de error:** Se elige un centro $a$ cercano a $x$ donde $f(a)$ sea exacto, y se acota $|R_n(x)| < \text{error permitido}$ buscando el valor de $c \in (a, x)$ que maximiza $|f^{(n+1)}(c)|$.
2. **Cálculo de límites:** Sustituir funciones por sus desarrollos de Taylor cuando $x \to 0$, sacar factor común la potencia menor de $x$ y simplificar.

---

## 3.5 Estudio Local, Optimización y Representación Gráfica

### Extremos Relativos (Locales) y Absolutos
* **Candidatos a extremos relativos en $I$:** Puntos interiores donde $f'(c) = 0$ (puntos críticos), puntos donde $\nexists f'(c)$, y los extremos $a, b$ si el intervalo es cerrado.
* **Criterio de la 1ª derivada (en punto interior $c$):**
  * $f'$ pasa de $+$ a $-$ en $c \implies$ **Máximo local**.
  * $f'$ pasa de $-$ a $+$ en $c \implies$ **Mínimo local**.
  * $f'$ no cambia de signo $\implies$ No hay extremo local.
* **Criterio de la 2ª derivada (si $f'(c) = 0$):**
  * $f''(c) > 0 \implies$ **Mínimo local**.
  * $f''(c) < 0 \implies$ **Máximo local**.
* **Procedimiento para Extremos Absolutos en $[a, b]$ continuo:**
  1. Hallar todos los puntos $c \in (a, b)$ donde $f'(c) = 0$ o $\nexists f'(c)$.
  2. Evaluar $f$ en esos puntos y en los extremos del intervalo: $f(a), f(c_1), \dots, f(c_n), f(b)$.
  3. El mayor valor es el **máximo absoluto** y el menor es el **mínimo absoluto**.

### Curvatura y Puntos de Inflexión
*(Nota: Terminología según el temario)*
* $f''(x_0) > 0 \implies f$ es **convexa** ($\cup$, gráfica por encima de la tangente).
* $f''(x_0) < 0 \implies f$ es **cóncava** ($\cap$, gráfica por debajo de la tangente).
* **Punto de inflexión:** Punto donde la gráfica cruza su tangente (cambia de concavidad a convexidad o viceversa). Criterio suficiente: $f''(x_0) = 0$ y $f'''(x_0) \neq 0$ (o cambio de signo de $f''$).

> [!warning] Error común en puntos de inflexión
> Que $f''(x_0) = 0$ **no garantiza** un punto de inflexión. Ejemplo: $f(x) = x^4$ tiene $f''(0) = 0$, pero $x=0$ es un mínimo local (siempre convexa).

### Guion Completo de Representación Gráfica
1. **Dominio** $D(f)$ y simetrías/continuidad.
2. **Puntos de corte** con los ejes: Eje $Y \to (0, f(0))$; Eje $X \to f(x) = 0$.
3. **Asíntotas:** Verticales ($x = x_0 \notin D(f)$) y Horizontales ($x \to \pm\infty$).
4. **Monotonía y Extremos:** Resolver $f'(x) = 0$, estudiar signo de $f'(x)$ en los intervalos determinados por raíces de $f'$ y discontinuidades.
5. **Curvatura e Inflexión:** Resolver $f''(x) = 0$, estudiar signo de $f''(x)$.
6. **Esbozo** integrando toda la información.

---

## 3.6 Regla de L'Hôpital

Si $\lim_{x \to a} \frac{f(x)}{g(x)}$ presenta una indeterminación del tipo **$\frac{0}{0}$** o **$\frac{\infty}{\infty}$** (con $a \in \mathbb{R}$ o $a = \pm\infty$), y existe $\lim_{x \to a} \frac{f'(x)}{g'(x)} = L$, entonces:
$$\lim_{x \to a} \frac{f(x)}{g(x)} = \lim_{x \to a} \frac{f'(x)}{g'(x)} = L$$

* **Indeterminación $0 \cdot \infty$:** Se transforma en $\frac{0}{0}$ o $\frac{\infty}{\infty}$ reescribiendo $f(x) \cdot g(x) = \frac{f(x)}{1/g(x)}$ o $\frac{g(x)}{1/f(x)}$.

> [!warning] Error fatal con L'Hôpital
> 1. **Aplicarlo sin indeterminación:** Si el límite no es $\frac{0}{0}$ ni $\frac{\infty}{\infty}$, L'Hôpital da un resultado **falso**.
> 2. **Derivar como un cociente:** Se deriva el numerador y el denominador **por separado** ($\frac{f'}{g'}$), NO se aplica la regla del cociente $\frac{f'g - fg'}{g^2}$.

---

# Módulo 4: Integración y Aplicaciones

## 4.1 Primitivas e Integrales Indefinidas

$F(x)$ es una **primitiva** de $f(x)$ si $F'(x) = f(x)$. El conjunto de todas las primitivas es la integral indefinida:
$$\int f(x)\,dx = F(x) + C \quad (C \in \mathbb{R})$$

### Tabla de Integrales Inmediatas (Básicas y Compuestas)

| Integral básica | Resultado | Forma compuesta ($u = u(x)$) | Resultado |
| :--- | :---: | :--- | :---: |
| $\int x^p \, dx \ (p \neq -1)$ | $\frac{x^{p+1}}{p+1} + C$ | $\int u^p \cdot u' \, dx \ (p \neq -1)$ | $\frac{u^{p+1}}{p+1} + C$ |
| $\int \frac{1}{x} \, dx$ | $\ln|x| + C$ | $\int \frac{u'}{u} \, dx$ | $\ln|u| + C$ |
| $\int e^x \, dx$ | $e^x + C$ | $\int e^u \cdot u' \, dx$ | $e^u + C$ |
| $\int a^x \, dx$ | $\frac{a^x}{\ln(a)} + C$ | $\int a^u \cdot u' \, dx$ | $\frac{a^u}{\ln(a)} + C$ |
| $\int \sin(x) \, dx$ | $-\cos(x) + C$ | $\int \sin(u) \cdot u' \, dx$ | $-\cos(u) + C$ |
| $\int \cos(x) \, dx$ | $\sin(x) + C$ | $\int \cos(u) \cdot u' \, dx$ | $\sin(u) + C$ |

### Métodos de Integración

#### 1. Cambio de Variable (Sustitución)
Consiste en elegir $t = g(x)$, calcular $dt = g'(x)\,dx$, sustituir toda la integral a la variable $t$, integrar y deshacer el cambio.
$$\int f(\varphi(t))\varphi'(t)\,dt = \int f(x)\,dx$$

#### 2. Integración por Partes
Derivada de la regla del producto:
$$\int u \, dv = u \cdot v - \int v \, du$$

* **Regla mnemotécnica ALPES** para elegir $u$ (lo que derivamos; $dv$ será lo que integramos):
  1. **A**rcos ($\arcsin, \arctan\dots$)
  2. **L**ogaritmos ($\ln(x)$)
  3. **P**olinomios ($x^n$)
  4. **E**xponenciales ($e^x, a^x$)
  5. **S**enos / Cosenos ($\sin(x), \cos(x)$)
* **Integrales cíclicas:** En $\int e^x \cos(x)\,dx$, se aplica partes dos veces hasta que reaparece la integral original $I$, y se despeja algebraicamente $I$.

---

## 4.2 Integral Definida y Teoremas Fundamentales

La integral definida $\int_a^b f(x)\,dx$ representa el límite de las sumas de áreas de trapecios/rectángulos al refinar una partición de $[a, b]$.

### Propiedades de la Integral Definida
* $\int_a^b (f(x) + g(x))\,dx = \int_a^b f(x)\,dx + \int_a^b g(x)\,dx$
* $\int_a^b k f(x)\,dx = k \int_a^b f(x)\,dx$
* $\int_a^a f(x)\,dx = 0$ y $\int_b^a f(x)\,dx = -\int_a^b f(x)\,dx$
* **Additividad:** $\int_a^b f(x)\,dx = \int_a^c f(x)\,dx + \int_c^b f(x)\,dx$
* **Monotonía:** $f(x) \le g(x) \implies \int_a^b f(x)\,dx \le \int_a^b g(x)\,dx$
* **Cambio de variable en definida:** Al hacer $x = \varphi(t)$, se cambian los límites de integración: $\int_a^b f(x)\,dx = \int_{\varphi^{-1}(a)}^{\varphi^{-1}(b)} f(\varphi(t))\varphi'(t)\,dt$.

### Teorema del Valor Medio Integral
Si $f: [a, b] \to \mathbb{R}$ es continua, existe $c \in [a, b]$ tal que:
$$\int_a^b f(x)\,dx = f(c)(b - a)$$

### Teorema Fundamental del Cálculo (TFC)
1. **TFC I (Derivada de la función integral):** Si $f$ es continua en $[a, b]$ y $F(x) = \int_a^x f(t)\,dt$, entonces $F'(x) = f(x)$.
   * *Generalización con regla de la cadena:* Si $F(x) = \int_{a}^{g(x)} f(t)\,dt \implies F'(x) = f(g(x)) \cdot g'(x)$.
2. **TFC II (Regla de Barrow):** Si $F$ es cualquier primitiva de $f$ continua en $[a, b]$:
$$\int_a^b f(x)\,dx = \Big[F(x)\Big]_a^b = F(b) - F(a)$$

---

## 4.3 Aplicaciones Geométricas de la Integral Definida

### 1. Área de Regiones Planas
* **Entre una curva y el eje $X$ en $[a, b]$:** $A = \int_a^b |f(x)|\,dx$.
* **Entre dos curvas $f(x)$ y $g(x)$ en $[a, b]$:**
  1. Encontrar los puntos de corte resolviendo $f(x) = g(x)$ dentro de $(a, b)$: $c_1, c_2, \dots$
  2. Integrar en cada subintervalo restando la función superior menos la inferior (o tomando valor absoluto de cada integral por separado):
     $$A = \left|\int_a^{c_1} (g(x) - f(x))\,dx\right| + \left|\int_{c_1}^{c_2} (g(x) - f(x))\,dx\right| + \dots$$

> [!warning] Error común en cálculo de áreas
> **Nunca** integres directamente $\int_a^b (g(x) - f(x))\,dx$ sin comprobar antes si las curvas se cruzan en $(a, b)$, ya que las áreas positivas y negativas se cancelarían entre sí.

### 2. Longitud de Arco de Curva
Longitud de la gráfica $y = f(x)$ entre $x = a$ y $x = b$:
$$L = \int_a^b \sqrt{1 + \left(f'(x)\right)^2}\,dx$$

### 3. Cuerpos de Revolución (alrededor del eje $X$, $y = f(x) \ge 0$ en $[a, b]$)
* **Volumen del sólido de revolución:**
  $$V = \pi \int_a^b \left(f(x)\right)^2\,dx$$
* **Área de la superficie de revolución:**
  $$A_{\Sigma} = 2\pi \int_a^b f(x)\sqrt{1 + \left(f'(x)\right)^2}\,dx$$
