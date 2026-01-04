# Skróty klawiszowe - Neovim dla Rust

## Nawigacja po projekcie

| Skrót | Akcja |
|-------|-------|
| `<Space>ff` | Szukaj pliku |
| `<Space>fg` | Szukaj w treści (grep) |
| `<Space>fr` | Ostatnie pliki |
| `<Space>n` | Eksplorator plików |
| `<Space>fp` | Projekty |
| `<Space>fb` | Bufory |

## Nawigacja po kodzie (LSP)

| Skrót | Akcja |
|-------|-------|
| `gd` | Idź do definicji |
| `gD` | Idź do deklaracji |
| `gr` | Znajdź użycia (odniesienia) |
| `gI` | Implementacje |
| `gy` | Definicja typu |
| `K` | Dokumentacja (hover) |
| `<Space>fs` | Szukaj symbolu |
| `<Space>fS` | Szukaj symbolu (workspace) |
| `<Space>ca` | Code Action (quick fix) |
| `<Space>q` | Lista diagnostyki |

## Cargo/Rust

| Skrót | Akcja |
|-------|-------|
| `<Space>cr` | Uruchom |
| `<Space>cR` | Uruchom w terminalu |
| `<Space>cb` | Buduj |
| `<Space>ct` | Testy |
| `<Space>cT` | Wybierz test (rust-analyzer) |
| `<Space>ctn` | Powtórz ostatni test |
| `<Space>ck` | Sprawdź błędy (check) |
| `<Space>cl` | Clippy |
| `<Space>cf` | Formatuj (rustfmt) |
| `<Space>cx` | Napraw ostrzeżenia |
| `<Space>cc` | Wyczyść (clean) |
| `<Space>cB` | Benchmark |

### Rust-analyzer (tylko w plikach .rs)

| Skrót | Akcja |
|-------|-------|
| `<Space>ce` | Wyjaśnij błąd |
| `<Space>cE` | Pełna diagnostyka |
| `<Space>cm` | Rozwiń makro |
| `<Space>ch` | Akcje hover |
| `<Space>cj` | Złącz linie |
| `<Space>co` | Otwórz Cargo.toml |
| `<Space>cP` | Moduł nadrzędny |
| `<Space>cRR` | Lista uruchamialnych |

### Zależności

| Skrót | Akcja |
|-------|-------|
| `<Space>cda` | Dodaj zależność |
| `<Space>cdx` | Usuń zależność |
| `<Space>cdu` | Aktualizuj |
| `<Space>cdo` | Przestarzałe |
| `<Space>cdt` | Drzewo zależności |
| `<Space>cdA` | Audyt bezpieczeństwa |

### Projekt

| Skrót | Akcja |
|-------|-------|
| `<Space>cpn` | Nowy projekt |
| `<Space>cpd` | Dokumentacja |
| `<Space>cpp` | Publikuj |
| `<Space>cpi` | Instaluj binarkę |
| `<Space>cps` | Szukaj crate |

## Debugowanie

| Skrót | Akcja |
|-------|-------|
| `<Space>db` | Toggle breakpoint |
| `<Space>dB` | Breakpoint warunkowy |
| `<Space>cD` | Debug (wybierz target) |
| `<Space>cdr` | Powtórz debug |
| `<Space>dc` | Kontynuuj / Start |
| `<Space>dC` | Uruchom do kursora |
| `<Space>di` | Step into (wejdź w funkcję) |
| `<Space>do` | Step over (następna linia) |
| `<Space>dO` | Step out (wyjdź z funkcji) |
| `<Space>dp` | Pauza |
| `<Space>dr` | Restart |
| `<Space>dq` | Zakończ |
| `<Space>du` | Panel debuggera |
| `<Space>de` | Ewaluuj wyrażenie |

## Git

| Skrót | Akcja |
|-------|-------|
| `<Space>gg` | LazyGit (pełny UI) |
| `<Space>gs` | Status |
| `<Space>gb` | Gałęzie |
| `<Space>gl` | Historia |
| `<Space>gL` | Historia linii |
| `<Space>gf` | Historia pliku |
| `<Space>gd` | Różnice (diff) |
| `<Space>gS` | Schowek (stash) |
| `<Space>go` | Otwórz w przeglądarce |

## Okna

| Skrót | Akcja |
|-------|-------|
| `Ctrl+h` | Fokus lewo |
| `Ctrl+j` | Fokus dół |
| `Ctrl+k` | Fokus góra |
| `Ctrl+l` | Fokus prawo |
| `<Space>wv` | Podziel pionowo |
| `<Space>ws` | Podziel poziomo |
| `<Space>wq` | Zamknij okno |
| `<Space>wo` | Tylko to okno |
| `<Space>w=` | Wyrównaj rozmiary |

## Zakładki (taby)

| Skrót | Akcja |
|-------|-------|
| `<Space><Tab><Tab>` | Nowa zakładka |
| `<Space><Tab>e` | Następna |
| `<Space><Tab>q` | Poprzednia |
| `<Space><Tab>d` | Zamknij |
| `<Space><Tab>o` | Tylko ta |

## Inne

| Skrót | Akcja |
|-------|-------|
| `Ctrl+s` | Zapisz |
| `Ctrl+Enter` | Nowa linia (Rust: średnik + nowa linia) |
| `<` / `>` | Wcięcia (visual mode) |
| `F12` | Terminal |
| `<Space>?` | Pokaż wszystkie skróty |
| `Esc` | Wyczyść podświetlenie wyszukiwania |

---

## Typowy workflow

```
1. Otwórz projekt          → <Space>fp
2. Znajdź plik             → <Space>ff
3. Pisz kod                → K (hover), gd (definicja)
4. Sprawdź błędy           → <Space>ck lub <Space>cl
5. Napraw błąd             → <Space>ca (code action)
6. Uruchom                 → <Space>cr
7. Debug                   → <Space>db + <Space>cD
8. Testy                   → <Space>ct lub <Space>cT
9. Commit                  → <Space>gg
```
