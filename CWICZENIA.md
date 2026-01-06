# Ćwiczenia praktyczne - Neovim dla Rust

Plik zawiera serię ćwiczeń do opanowania efektywnej pracy w Neovim.
Zalecana kolejność: najpierw przećwicz krótkie ćwiczenia (Część 1), potem przejdź do scenariuszy (Część 2).

---

# CZĘŚĆ 1: Krótkie ćwiczenia (dryl codzienny)

## 1.1 Nawigacja podstawowa

Otwórz dowolny plik z kodem i przećwicz:

| Ćwiczenie | Komenda | Cel |
|-----------|---------|-----|
| Ruch w linii | `h` `j` `k` `l` | Poruszaj się bez strzałek |
| Po słowach | `w` `b` `e` | Skacz po słowach (w-następne, b-poprzednie, e-koniec) |
| Po SŁOWACH | `W` `B` `E` | Jak wyżej, ale ignoruje interpunkcję |
| Początek/koniec linii | `0` `$` | Skocz na początek/koniec linii |
| Pierwszy znak | `^` | Skocz do pierwszego nie-białego znaku |
| Początek/koniec pliku | `gg` `G` | Skocz na górę/dół pliku |
| Do linii N | `42G` lub `:42` | Skocz do linii 42 |
| Po paragrafach | `{` `}` | Skacz między pustymi liniami |
| Pół strony | `Ctrl+d` `Ctrl+u` | Przewiń pół strony w dół/górę |
| Centruj widok | `zz` `zt` `zb` | Wycentruj linię / góra / dół ekranu |

**Wyzwanie:** Poruszaj się po pliku bez użycia strzałek przez 5 minut.

---

## 1.2 Wyszukiwanie

```rust
fn calculate_sum(numbers: &[i32]) -> i32 {
    let mut sum = 0;
    for num in numbers {
        sum += num;
    }
    sum
}

fn calculate_product(numbers: &[i32]) -> i32 {
    let mut product = 1;
    for num in numbers {
        product *= num;
    }
    product
}
```

| Ćwiczenie | Komenda | Cel |
|-----------|---------|-----|
| Szukaj w przód | `/calculate` + `Enter` | Znajdź "calculate" |
| Następne wystąpienie | `n` | Skocz do następnego |
| Poprzednie wystąpienie | `N` | Skocz do poprzedniego |
| Szukaj w tył | `?sum` + `Enter` | Szukaj wstecz |
| Słowo pod kursorem | `*` | Szukaj słowa pod kursorem w przód |
| Słowo pod kursorem (wstecz) | `#` | Szukaj słowa pod kursorem w tył |
| Znak w linii | `fn` | Skocz do następnego 'n' w linii |
| Znak w linii (wstecz) | `Fn` | Skocz do poprzedniego 'n' |
| Do znaku | `t;` | Skocz tuż przed ';' |
| Powtórz f/t | `;` `,` | Powtórz ostatnie f/t w przód/tył |

**Wyzwanie:** Znajdź wszystkie wystąpienia `sum` używając `*` i `n`.

---

## 1.3 Find & Replace

```rust
let user_name = "John";
let user_age = 25;
let user_email = "john@example.com";
println!("User: {}, Age: {}", user_name, user_age);
```

| Ćwiczenie | Komenda | Cel |
|-----------|---------|-----|
| Zamień w linii | `:s/user/customer/` | Zamień pierwsze wystąpienie |
| Wszystkie w linii | `:s/user/customer/g` | Zamień wszystkie w linii |
| W całym pliku | `:%s/user/customer/g` | Zamień w całym pliku |
| Z potwierdzeniem | `:%s/user/customer/gc` | Pytaj o każdą zamianę (y/n/a/q) |
| W zaznaczeniu | `:'<,'>s/old/new/g` | Zaznacz V, potem komenda |
| Case insensitive | `:%s/USER/customer/gi` | Ignoruj wielkość liter |
| Całe słowo | `:%s/\<user\>/customer/g` | Tylko całe słowo "user" |

**Wyzwanie:** Zamień wszystkie `user_` na `client_` z potwierdzeniem.

---

## 1.4 Operatory + Motion

Vim działa na zasadzie: `operator` + `motion/textobject`

```rust
fn process_data(input: String) -> Result<String, Error> {
    let trimmed = input.trim();
    let result = format!("Processed: {}", trimmed);
    Ok(result)
}
```

| Ćwiczenie | Komenda | Cel |
|-----------|---------|-----|
| Usuń słowo | `dw` | Usuń od kursora do końca słowa |
| Usuń całe słowo | `diw` | Usuń słowo (inner word) |
| Usuń słowo + spację | `daw` | Usuń słowo ze spacją (a word) |
| Usuń do końca linii | `d$` lub `D` | Usuń do końca linii |
| Usuń linię | `dd` | Usuń całą linię |
| Zmień słowo | `ciw` | Usuń słowo i wejdź w insert mode |
| Zmień w cudzysłowie | `ci"` | Zmień tekst w "" |
| Zmień w nawiasach | `ci(` | Zmień tekst w () |
| Kopiuj linię | `yy` | Skopiuj całą linię |
| Kopiuj słowo | `yiw` | Skopiuj słowo |
| Kopiuj w nawiasach | `yi(` | Skopiuj zawartość () |
| Wklej | `p` / `P` | Wklej po/przed kursorem |

**Wyzwanie:** Zmień `"Processed: {}"` na `"Output: {}"` używając `ci"`.

---

## 1.5 Makra i rejestry

```rust
let a = 1;
let b = 2;
let c = 3;
let d = 4;
let e = 5;
```

Chcemy zmienić na: `let a: i32 = 1;`

| Ćwiczenie | Komenda | Cel |
|-----------|---------|-----|
| Nagraj makro | `qa` | Rozpocznij nagrywanie do rejestru 'a' |
| Zakończ nagrywanie | `q` | Zatrzymaj nagrywanie |
| Odtwórz makro | `@a` | Odtwórz makro 'a' |
| Powtórz ostatnie makro | `@@` | Odtwórz poprzednie makro |
| Odtwórz N razy | `5@a` | Odtwórz makro 5 razy |
| Kopiuj do rejestru | `"ay` | Kopiuj do rejestru 'a' |
| Wklej z rejestru | `"ap` | Wklej z rejestru 'a' |
| Schowek systemowy | `"+y` / `"+p` | Kopiuj/wklej do/z systemu |
| Zobacz rejestry | `:reg` | Pokaż zawartość rejestrów |

**Wyzwanie - nagraj makro:**
1. `qa` - zacznij nagrywanie
2. `f=` - skocz do =
3. `i: i32` + `Esc` - wstaw typ
4. `j0` - następna linia, początek
5. `q` - zakończ nagrywanie
6. `4@a` - zastosuj do pozostałych linii

---

## 1.6 Text Objects (mini.ai)

```rust
struct User {
    name: String,
    age: u32,
}

impl User {
    fn new(name: String, age: u32) -> Self {
        Self { name, age }
    }

    fn greet(&self) -> String {
        if self.age >= 18 {
            format!("Hello, adult {}!", self.name)
        } else {
            format!("Hi, young {}!", self.name)
        }
    }
}
```

| Ćwiczenie | Komenda | Cel |
|-----------|---------|-----|
| Zaznacz funkcję (wewnątrz) | `vif` | Zaznacz ciało funkcji |
| Zaznacz funkcję (cała) | `vaf` | Zaznacz całą funkcję z sygnaturą |
| Usuń funkcję | `daf` | Usuń całą funkcję |
| Zaznacz struct/impl | `vac` | Zaznacz całą klasę/struct/impl |
| Zaznacz parametr | `via` | Zaznacz argument funkcji |
| Usuń parametr | `daa` | Usuń argument z przecinkiem |
| Zaznacz pętlę | `vao` | Zaznacz całą pętlę |
| Zaznacz if | `vai` | Zaznacz cały blok if |
| Skocz do funkcji | `]m` / `[m` | Następna/poprzednia funkcja |
| Skocz do klasy | `]]` / `[[` | Następna/poprzednia klasa |

**Wyzwanie:** Ustaw kursor w funkcji `greet`, wciśnij `daf` - usuń całą funkcję.

---

## 1.7 Surround (mini.surround)

```rust
let name = John;
let message = Hello World;
let data = vec[1, 2, 3];
```

| Ćwiczenie | Komenda | Cel |
|-----------|---------|-----|
| Dodaj "" wokół słowa | `saiw"` | Otocz słowo cudzysłowem |
| Dodaj () wokół słowa | `saiw)` | Otocz słowo nawiasami |
| Dodaj "" wokół 2 słów | `sa2aw"` | Otocz 2 słowa cudzysłowem |
| Usuń cudzysłowy | `sd"` | Usuń otaczające "" |
| Usuń nawiasy | `sd)` lub `sd(` | Usuń otaczające () |
| Zamień "" na '' | `sr"'` | Zamień cudzysłowy |
| Zamień () na [] | `sr)]` | Zamień nawiasy |
| Zamień [] na () | `sr](` | Zamień nawiasy |
| Dodaj w visual mode | `v` + zaznacz + `sa"` | Otocz zaznaczenie |

**Wyzwanie:** Napraw powyższy kod:
1. Na `John` wciśnij `saiw"` → `"John"`
2. Na `Hello` wciśnij `sa2aw"` → `"Hello World"`
3. Na `vec` zamień `[` na `!` + `[`: ustaw kursor na `[`, wciśnij `sr[)` → `vec(1, 2, 3)`, potem napraw na `vec![...]`

---

## 1.8 LSP - Nawigacja

| Ćwiczenie | Komenda | Cel |
|-----------|---------|-----|
| Dokumentacja | `K` | Pokaż dokumentację pod kursorem |
| Idź do definicji | `gd` | Skocz do definicji funkcji/typu |
| Idź do deklaracji | `gD` | Skocz do deklaracji |
| Znajdź użycia | `gr` | Pokaż wszystkie miejsca użycia |
| Implementacje | `gI` | Pokaż implementacje trait/interface |
| Definicja typu | `gy` | Skocz do definicji typu zmiennej |

**Wyzwanie:** W projekcie Rust:
1. Ustaw kursor na nazwie funkcji
2. `K` - przeczytaj dokumentację
3. `gr` - zobacz gdzie jest używana
4. `gd` - skocz do definicji

---

## 1.9 LSP - Diagnostyka i poprawki

| Ćwiczenie | Komenda | Cel |
|-----------|---------|-----|
| Pokaż błąd | `ge` | Wyświetl błąd w okienku float |
| Wyjaśnij błąd (Rust) | `gE` | Szczegółowe wyjaśnienie błędu |
| Następny błąd | `]d` | Skocz do następnego błędu |
| Poprzedni błąd | `[d` | Skocz do poprzedniego błędu |
| Menu akcji | `ga` | Pokaż dostępne akcje kodu |
| Szybka poprawka | `gf` | Zastosuj sugerowaną poprawkę |
| Napraw wszystko | `gF` | Napraw wszystkie błędy w pliku |

**Wyzwanie:** Znajdź błąd w kodzie, przeczytaj wyjaśnienie (`gE`), zastosuj poprawkę (`gf`).

---

## 1.10 Picker (snacks.nvim)

| Ćwiczenie | Komenda | Cel |
|-----------|---------|-----|
| Szukaj pliku | `<Space>ff` | Znajdź plik po nazwie |
| Grep w treści | `<Space>fg` | Szukaj tekstu w plikach |
| Ostatnie pliki | `<Space>fr` | Lista ostatnio otwartych |
| Bufory | `<Space>fb` | Lista otwartych buforów |
| Symbole w pliku | `<Space>fs` | Lista funkcji/typów w pliku |
| Symbole w projekcie | `<Space>fS` | Lista symboli w całym projekcie |
| Smart search | `<Space><Space>` | Inteligentne wyszukiwanie |
| Projekty | `<Space>fp` | Lista projektów |
| Pomoc | `<Space>fh` | Szukaj w dokumentacji |
| Skróty | `<Space>fk` | Lista skrótów klawiszowych |

**Wyzwanie:** Znajdź wszystkie pliki zawierające słowo "config" używając `<Space>fg`.

---

## 1.11 Git

| Ćwiczenie | Komenda | Cel |
|-----------|---------|-----|
| LazyGit | `<Space>gg` | Otwórz pełny UI Git |
| Następny hunk | `]c` | Skocz do następnej zmiany |
| Poprzedni hunk | `[c` | Skocz do poprzedniej zmiany |
| Stage hunk | `<Space>ghs` | Dodaj zmianę do staging |
| Reset hunk | `<Space>ghr` | Cofnij zmianę |
| Preview hunk | `<Space>ghp` | Podgląd zmiany |
| Blame line | `<Space>ghb` | Kto zmienił tę linię |
| Diff this | `<Space>ghd` | Pokaż diff dla pliku |
| Git status | `<Space>gs` | Lista zmienionych plików |
| Historia | `<Space>gl` | Historia commitów |

**Wyzwanie:** Zmodyfikuj plik, przejrzyj zmiany (`]c`), dodaj do staging (`<Space>ghs`).

---

## 1.12 Cargo/Rust

| Ćwiczenie | Komenda | Cel |
|-----------|---------|-----|
| Build | `<Space>cb` | Zbuduj projekt |
| Run | `<Space>cr` | Uruchom projekt |
| Test | `<Space>ct` | Uruchom testy |
| Wybierz test | `<Space>cT` | Wybierz konkretny test |
| Check | `<Space>ck` | Sprawdź błędy |
| Clippy | `<Space>cl` | Uruchom linter |
| Format | `<Space>cf` | Sformatuj kod |
| Fix | `<Space>cx` | Auto-napraw ostrzeżenia |
| Debug | `<Space>cD` | Wybierz target do debugowania |
| Otwórz Cargo.toml | `<Space>co` | Szybki dostęp do Cargo.toml |

**Wyzwanie:** Uruchom `<Space>cl` (Clippy), napraw ostrzeżenia używając `<Space>cx`.

---

## 1.13 Okna i nawigacja

| Ćwiczenie | Komenda | Cel |
|-----------|---------|-----|
| Split pionowy | `<Space>wv` | Podziel okno pionowo |
| Split poziomy | `<Space>ws` | Podziel okno poziomo |
| Przejdź lewo | `Ctrl+h` | Przejdź do lewego okna |
| Przejdź dół | `Ctrl+j` | Przejdź do dolnego okna |
| Przejdź góra | `Ctrl+k` | Przejdź do górnego okna |
| Przejdź prawo | `Ctrl+l` | Przejdź do prawego okna |
| Zamknij okno | `<Space>wq` | Zamknij bieżące okno |
| Tylko to okno | `<Space>wo` | Zamknij wszystkie inne |
| Wyrównaj | `<Space>w=` | Wyrównaj rozmiary okien |
| Eksplorator plików | `<Space>n` | Toggle Neo-tree |

**Wyzwanie:** Otwórz 2 pliki obok siebie (`<Space>wv`), nawiguj między nimi (`Ctrl+h/l`).

---

## 1.14 Terminal

| Ćwiczenie | Komenda | Cel |
|-----------|---------|-----|
| Toggle terminal | `F12` lub `<Space>tt` | Otwórz/zamknij terminal |
| Terminal floating | `<Space>tf` | Terminal w oknie pływającym |
| Terminal poziomy | `<Space>th` | Terminal na dole |
| Terminal pionowy | `<Space>tv` | Terminal z boku |
| Terminal 1-4 | `<Space>t1` - `<Space>t4` | Przełącz numerowany terminal |
| Wybierz terminal | `<Space>ts` | Lista terminali |
| Wyślij linię | `<Space>tl` | Wyślij linię do terminala |

**Wyzwanie:** Otwórz terminal (`F12`), uruchom `cargo build`, wróć do edycji (`Esc`).

---

# CZĘŚĆ 2: Rozbudowane scenariusze

## Scenariusz 1: Refaktoryzacja funkcji

### Kontekst
Masz funkcję, która robi za dużo. Twoim zadaniem jest wydzielić logikę walidacji do osobnej funkcji.

### Kod startowy

```rust
fn process_user_data(name: &str, age: i32, email: &str) -> Result<String, String> {
    // Walidacja - do wydzielenia
    if name.is_empty() {
        return Err("Name cannot be empty".to_string());
    }
    if age < 0 || age > 150 {
        return Err("Invalid age".to_string());
    }
    if !email.contains('@') {
        return Err("Invalid email".to_string());
    }

    // Właściwa logika
    let formatted = format!("{} ({}) - {}", name, age, email);
    Ok(formatted)
}
```

### Kroki

1. **Zaznacz kod walidacji:**
   - Ustaw kursor na `if name.is_empty()`
   - `V` - tryb visual line
   - `}` - zaznacz do pustej linii (lub `8j` - 8 linii w dół)

2. **Wytnij zaznaczenie:**
   - `d` - wytnij zaznaczone linie

3. **Utwórz nową funkcję powyżej:**
   - `gg` - idź na początek pliku
   - `O` - nowa linia powyżej, insert mode
   - Wpisz sygnaturę:
   ```rust
   fn validate_user_data(name: &str, age: i32, email: &str) -> Result<(), String> {
   ```

4. **Wklej walidację:**
   - `p` - wklej wycięty kod
   - Dodaj `Ok(())` na końcu funkcji

5. **Zaktualizuj oryginalną funkcję:**
   - Dodaj wywołanie: `validate_user_data(name, age, email)?;`

6. **Sformatuj:**
   - `<Space>cf` - formatuj kod

### Oczekiwany rezultat

```rust
fn validate_user_data(name: &str, age: i32, email: &str) -> Result<(), String> {
    if name.is_empty() {
        return Err("Name cannot be empty".to_string());
    }
    if age < 0 || age > 150 {
        return Err("Invalid age".to_string());
    }
    if !email.contains('@') {
        return Err("Invalid email".to_string());
    }
    Ok(())
}

fn process_user_data(name: &str, age: i32, email: &str) -> Result<String, String> {
    validate_user_data(name, age, email)?;

    let formatted = format!("{} ({}) - {}", name, age, email);
    Ok(formatted)
}
```

---

## Scenariusz 2: Debugowanie błędu kompilacji

### Kontekst
Kod się nie kompiluje. Musisz znaleźć i naprawić wszystkie błędy.

### Kod startowy

```rust
fn calculate_average(numbers: Vec<i32>) -> f64 {
    let sum = numbers.iter().sum();
    let count = numbers.len();
    sum / count
}

fn main() {
    let data = vec![1, 2, 3, 4, 5];
    let avg = calculate_average(data);
    println!("Average: {}", avg);
    println!("Data: {:?}", data);  // błąd - data już przeniesiona
}
```

### Kroki

1. **Zbuduj projekt:**
   - `<Space>cb` - cargo build
   - Zobaczysz błędy kompilacji

2. **Przejdź do pierwszego błędu:**
   - `]d` - skocz do pierwszego błędu

3. **Przeczytaj wyjaśnienie:**
   - `ge` - pokaż błąd
   - `gE` - szczegółowe wyjaśnienie (Rust)

4. **Napraw pierwszy błąd (typy):**
   - Problem: `sum / count` - różne typy
   - Popraw na: `sum as f64 / count as f64`
   - Lub użyj `gf` jeśli LSP sugeruje poprawkę

5. **Przejdź do następnego błędu:**
   - `]d` - następny błąd

6. **Napraw błąd ownership:**
   - Zmień `numbers: Vec<i32>` na `numbers: &[i32]`
   - Zmień wywołanie na `calculate_average(&data)`

7. **Sprawdź ponownie:**
   - `<Space>ck` - cargo check
   - Powinno się skompilować

### Oczekiwany rezultat

```rust
fn calculate_average(numbers: &[i32]) -> f64 {
    let sum: i32 = numbers.iter().sum();
    let count = numbers.len();
    sum as f64 / count as f64
}

fn main() {
    let data = vec![1, 2, 3, 4, 5];
    let avg = calculate_average(&data);
    println!("Average: {}", avg);
    println!("Data: {:?}", data);
}
```

---

## Scenariusz 3: Code Review z Git

### Kontekst
Zrobiłeś zmiany w kilku miejscach i chcesz przejrzeć je przed commitem.

### Kroki

1. **Zmodyfikuj plik** (dowolny w projekcie):
   - Dodaj komentarz
   - Zmień nazwę zmiennej
   - Dodaj nową funkcję

2. **Przejrzyj zmiany:**
   - `]c` - skocz do pierwszej zmiany (hunk)
   - `<Space>ghp` - podgląd zmiany
   - `]c` - następna zmiana

3. **Selectywny staging:**
   - Na dobrej zmianie: `<Space>ghs` - stage hunk
   - Na złej zmianie: `<Space>ghr` - reset hunk (cofnij)

4. **Sprawdź co jest w staging:**
   - `<Space>gs` - git status picker
   - Lub `<Space>gg` - LazyGit

5. **Zobacz diff przed commitem:**
   - `<Space>gd` - diff picker

6. **Commituj (w LazyGit):**
   - `<Space>gg`
   - `c` - commit
   - Wpisz message
   - `Enter`

---

## Scenariusz 4: Nawigacja w nieznanym kodzie

### Kontekst
Otwierasz nowy projekt i chcesz zrozumieć jak działa funkcja `main`.

### Kroki

1. **Znajdź punkt wejścia:**
   - `<Space>fg` - grep
   - Wpisz `fn main`
   - Wybierz wynik

2. **Zrozum strukturę:**
   - `<Space>fs` - symbole w pliku
   - Zobacz listę funkcji/struktur

3. **Śledź wywołania:**
   - Ustaw kursor na wywołaniu funkcji
   - `gd` - idź do definicji
   - `K` - przeczytaj dokumentację
   - `Ctrl+o` - wróć (jump back)

4. **Znajdź użycia:**
   - Na interesującej funkcji: `gr`
   - Przejrzyj gdzie jest używana

5. **Przejrzyj typy:**
   - Na zmiennej: `gy` - idź do definicji typu
   - `K` - dokumentacja typu

6. **Nawiguj po funkcjach:**
   - `]m` - następna funkcja
   - `[m` - poprzednia funkcja

7. **Wróć do początku:**
   - `Ctrl+o` wielokrotnie - cofaj się po historii skoków
   - Lub `<Space>fr` - ostatnie pliki

---

## Scenariusz 5: Praca z wieloma plikami

### Kontekst
Musisz skopiować struct z jednego pliku i użyć go w innym, dodając implementację.

### Kroki

1. **Otwórz pierwszy plik:**
   - `<Space>ff` - znajdź plik źródłowy

2. **Podziel ekran:**
   - `<Space>wv` - split pionowy

3. **Otwórz drugi plik w nowym oknie:**
   - `<Space>ff` - znajdź plik docelowy

4. **Wróć do pierwszego okna:**
   - `Ctrl+h` - przejdź w lewo

5. **Skopiuj struct:**
   - Znajdź struct: `<Space>fs` - symbole, wybierz struct
   - `vac` - zaznacz całą strukturę
   - `y` - kopiuj

6. **Przejdź do drugiego okna:**
   - `Ctrl+l` - przejdź w prawo

7. **Wklej i dostosuj:**
   - `p` - wklej
   - Dodaj `impl` block

8. **Synchronizuj zmiany:**
   - Edytuj w jednym oknie
   - Zmiany widoczne od razu w obu

9. **Zamknij split:**
   - `<Space>wq` - zamknij bieżące okno
   - Lub `<Space>wo` - zostaw tylko bieżące

---

# Wskazówki końcowe

## Budowanie nawyków

1. **Codziennie** przećwicz 2-3 krótkie ćwiczenia z Części 1
2. **Co tydzień** zrób jeden scenariusz z Części 2
3. **Wyłącz strzałki** - użyj `:noremap <Up> <Nop>` itd.
4. **Używaj `.`** - powtarza ostatnią zmianę
5. **Używaj `u`** - cofnij, `Ctrl+r` - ponów

## Najważniejsze kombinacje do zapamiętania

| Combo | Akcja |
|-------|-------|
| `ciw` | Zmień słowo |
| `ci"` | Zmień w cudzysłowie |
| `daf` | Usuń funkcję |
| `vif` | Zaznacz ciało funkcji |
| `gd` | Idź do definicji |
| `gr` | Znajdź użycia |
| `gf` | Szybka poprawka |
| `<Space>ff` | Znajdź plik |
| `<Space>fg` | Grep w plikach |
| `<Space>gg` | LazyGit |

## Debugging workflow

```
1. <Space>ck          → Sprawdź błędy
2. ]d                 → Idź do błędu
3. ge / gE            → Przeczytaj błąd
4. gf                 → Napraw automatycznie
5. <Space>ck          → Sprawdź ponownie
```

## Szybkie zapamiętywanie

- **d** = delete (usuń)
- **c** = change (zmień)
- **y** = yank (kopiuj)
- **v** = visual (zaznacz)
- **i** = inner (wewnątrz)
- **a** = around (wokół)
- **f** = function
- **w** = word
- **s** = surround
