### InheritanceSurcharge.lean — 相続税法 art. 18（相続税額の加算）

- **pinned ids**: law_id `325AC0000000073` / rev `325AC0000000073_20260401_506AC0000000008`（施行 2026-04-01, amend `506AC0000000008`）; `data/raw/325AC0000000073_20260401_506AC0000000008.law.json`（856,326 bytes）を自前 Python で独立再計算 → SHA-256 `C01BB9BE910CE849C82E26F1DD5D262DDF5BB55A1BF042512451460F275043A7`（doc-comment と一致）。`law_full_text` を再帰 flatten し `Article attr.Num="18"` を 6 件検出 → caption「（相続税額の加算）」の path `(1,3,1,1,9)` を **LOCATED**（他 5 件は附則の経過措置・連合審査会等で無関係）。正規化 leaf 318 文字。原文・Lean は doc-comment / `transcription_audit.py` を信じず raw から直接抽出。
- **独立抽出**: 原文 leaf を `re.sub(r"[\s　]+","",...)` 正規化後、doc-comment の 3 needle が**各 1 回**出現（`/` 区切りで count=1/1/1）。原文のアラビア数字トークンは段落番号 `２` のみ（利率・附則番号は漢字表記）。

  | 原文リテラル | 独立計算 | Lean 定数 | 照合 |
  |---|---|---|---|
  | 「同条の規定により算出した金額にその百分の二十に相当する金額を加算した金額とする。」（1 項） | 加算額 = art17額 × 20/100, 税額 = art17額 + 加算額 | `surcharge20 b = (b*20)/100`, `taxWithSurcharge false t = t + surcharge20 t` | ✅ |
  | 「一親等の血族…及び配偶者以外の者である場合においては」（1 項該当性） | 該当する者にのみ 20% 加算、該当しない者は art17額のまま | `taxWithSurcharge e t = if e then t else t + surcharge20 t`（`e` は caller-established） | ✅ BY-DESIGN |
  | 「前項の一親等の血族には…養子となつている場合を含まない…ただし…代襲して…場合は、この限りでない。」（2 項） | 血族・配偶者・代襲・養子除外の判定は家族関係事実依存 | Bool `isEligibleRelativeOrSpouse` として外部確定、式に入れず | ✅ BY-DESIGN |
  | 「前条の規定により算出した金額」（art17 ベース） | art17 算出は本モジュール外 | `taxArt17 : Money` を入力として受け取る | ✅ BY-DESIGN |
  | 端数処理の明示規定なし（「百分の二十に相当する金額」のみ） | Nat の `(n*20)/100`（切り捨て）としてモデル化 | `surcharge20` の自然数除算 | ✅ BY-DESIGN |
- **反例**: 自前 Python で定式 `s20(n)=(n*20)//100`, `tax(e,t)=t if e else t+s20(t)` を再計算し `.lean` / `-Spec` / `-Tests` の全 `by decide` 期待値（新規境界例を含む）と照合 → **全一致, 矛盾 0**。境界: `s20(5)=1`（1..13 の最小正値で 20% が 1 以上になる最初の点）, `s20(4)=0`, `s20(1)=0`（切捨て）, `s20(100)=20`, `s20(1000)=200`, `tax(false,0)=0`, `tax(true,1000000)=1000000`（恒等）, `tax(false,125)=150`, `tax(false,1000000)=1200000`, `tax(true,2750000)=2750000`。なお doc-comment の art.18(1) 引用は「取得した者が**、**当該…」と raw（「取得した者が当該…」）より読点「、」が 1 つ多い（逐語でない箇所を発見）が、モデル化されたリテラル「百分の二十に相当する金額を加算した金額とする」は raw と count=1 で一致し、実行コード・定数への影響なし（doc-comment のみの転記ニュアンス）。
- **判定**: **CONFIRMED 0（原文と Lean の実食い違いなし）**。BY-DESIGN 4: ①1 項の該当性（一親等の血族・配偶者・2 項の代襲 inclusion / 養子 exclusion）は家族関係事実依存のため caller-established Bool、②art17 ベース額は入力、③「百分の二十に相当する金額」の端数処理は法文に明示がなく Nat 切捨てを採用（modeling candidate）、④加算は「算出した金額に…加算」どおり art17 額への加算で実装（別ベースへの掛け算ではない）。**LOCATED, UNRESOLVED なし**。新規境界例（b）`surcharge20 5 = 1` は 1..13 の小正入力で 20% の切捨て閾値を示す。
- **H/T/D/C/U**: H=20% 加算が原文と異なる率/別ベースになる、又 該当性判定が式に誤って入る; T=3 needle 各1回 + 原文 leaf 数値トークン1（段落番号のみ） + 全 `by decide` 期待値の独立再計算（新規境界例含む）; D=NOT_CONFIRMED（不一致 0, CONFIRMED 0, BY-DESIGN 4）; C=doc-comment の 1 項読点 1 個過多は転記のみでモデル定数一致により排斥（実モデルへの CONFIRMED ではない）; U=血族・配偶者・代襲・養子の具体的該当性判定と 20% 加算額の端数処理の法的取扱いは caller-established／要専門家。
- **限定**: 本レビューは機械的独立クロスチェックであり、**人間の法律レビューではない**。本環境では `lake` / `lean` が PATH になくカーネル再実行は未実施（`by decide` 例は構成上カーネル判定される期待値と独立計算を照合）。一時 Python スクリプトは `D:\CodexData\Temp\advrev_10` に置き削除済み。

### ListedDividendWithholding.lean — 租税特別措置法 art. 9の3の二（上場株式等の配当等に係る源泉徴収義務等の特例）

- **pinned ids**: law_id `332AC0000000026` / rev `332AC0000000026_20261101_507AC0000000013`（施行 2026-11-01, amend `507AC0000000013`）; `data/raw/332AC0000000026_20261101_507AC0000000013.law.json`（14,512,569 bytes）を独立再計算 → SHA-256 `E6E6013BBC0608C6B48DEA01D50AC847C3E5D094F0420223171FFE1B5CF8D5EE`（doc-comment と一致, SpecialGiftRate / DeemedCapitalGainsCost / ResidentialTransferSpecialTax と同一 pin）。`Article attr.Num="9_3_2"` を 1 件検出、caption「（上場株式等の配当等に係る源泉徴収義務等の特例）」path `(1,3,1,1,24)` を **LOCATED**。正規化 leaf 3,882 文字。原文・Lean は doc-comment / `transcription_audit.py` を信じず raw から直接抽出。
- **独立抽出**: 原文 leaf 正規化後、doc-comment の 2 needle（1 項税率文・3 項控除限度文）が**各 1 回**出現（count=1/1）。原文のアラビア数字トークンは段落番号 `２`〜`９` のみ（率「百分の十五」「百分の二十」は漢字表記で数値トークンに出ない）。

  | 原文リテラル | 独立計算 | Lean 定数 | 照合 |
  |---|---|---|---|
  | 「…百分の十五（第一号に掲げる配当等で…大口株主等に対し交付をするものについては、百分の二十）の税率を乗じて計算した金額の所得税を徴収し…」 | 通常 15%, 大口株主等 20% → gross = floor((交付額+加算額)×rate) | `listedDividendRate false=15/100`, `true=20/100`, `withholdingGross = applyFloor` | ✅ |
  | 「その交付をする金額（第三項の規定により控除する同項各号に定める金額がある場合には、当該金額その他の政令で定める金額を加算した金額）」 | base = 交付額 + 控除対象外国税等 | `withholdingBase f = f.exchangeAmount + f.foreignSpecificTax` | ✅ BY-DESIGN |
  | 「同項の規定により徴収して納付すべき…所得税の額を限度として当該所得税の額から控除する。」（3 項） | 控除額 = min(外国税等, gross), net = gross − 控除額 | `withholdingDeduction = min f.foreignSpecificTax (withholdingGross f)`, `withholdingNet = gross − deduction` | ✅ |
  | 「上場株式等の配当等の次の各号に掲げる区分に応じ…（第一号〜六号）」「政令で定めるもの」 | 区分・大口株主等該当性は caller-established | Bool `isLargeShareholderDividend`（外部確定）, 区分定義は非モデル化 | ✅ BY-DESIGN |
  | 「当該利益の配当に対応する部分の金額として政令で定めるところにより計算した金額」（3 項各号の按分） | 按分計算は政令依存、外部金額として受け取る | `foreignSpecificTax : Money` を入力, 按分は非モデル化 | ✅ BY-DESIGN |
  | 「その徴収の日の属する月の翌月十日までに…納付」「（4）読み替え/（5）〜（7）復興特別所得税・地方税特例」「その他の政令で定める金額」 | 納付期限・読み替え・政令加算額等は計算スライ外 | 非モデル化（doc-comment に明記） | ✅ BY-DESIGN |
- **反例**: 自前 Python で定式 `rate(l)=20 if l else 15`, `gross(l,e,f)=((e+f)*rate(l))//100`, `ded=min(f,gross)`, `net=gross-ded` を再計算し `.lean` / `-Spec` / `-Tests` の全 `by decide` 期待値（新規境界例を含む）と照合 → **全一致, 矛盾 0**。境界: `net(false,7,0)=1`（1..13 の小正入力で 15% が 1 以上になる最初の点）, `net(false,100000,0)=15000`, `net(true,100000,0)=20000`, `base(false,1000000,50000)=1050000`, `net(false,1000000,50000)=107500`, `net(false,100000,50000)=0`（外国税>gross で saturate）, `net(false,1000000,157500)=16125`, `net(true,1000000,250000)=0`, `net(true,10000000,100000)=1920000`, `net(true,1000000,100000)=120000`, `net(false,1000000,100000)=65000`, `net(false,0,50000)=0`（0 交付）, `net(false,10000000000,0)=1500000000`。不等式 `ded≤gross`, `net≤gross`, `net≥0`, `base≥exchange`, large≥regular も原文「限度として」と整合。
- **判定**: **CONFIRMED 0（原文と Lean の実食い違いなし）**。BY-DESIGN 6: ①上場株式等の配当等の区分（第一号〜六号）・大口株主等判定は caller-established、②3 項各号の外国法人税等按分（政令）は外部金額、③端数処理（「乗じて計算した金額」に明示なし）を `applyFloor` 切捨てで model、④控除は「所得税の額を限度として」どおり min で実装、⑤「その他の政令で定める金額」の加算は `foreignSpecificTax` のみに限定、⑥納付期限・(4)〜(7) の読み替え等は非モデル化。**LOCATED, UNRESOLVED なし**。新規境界例（b）`withholdingNet ⟨false,7,0⟩ = 1` は 1..13 の小正入力で 15% の切捨て閾値を示す。
- **H/T/D/C/U**: H=15%/20% の取違え、加算・控除限度式が原文と食い違う、又 区分/按分が暗黙に決め打ちされる; T=2 needle 各1回 + 数値トークンが段落番号のみ + 全 `by decide` 期待値の独立再計算（新規境界例含む）; D=NOT_CONFIRMED（不一致 0, CONFIRMED 0, BY-DESIGN 6）; C=「控除は常に外国税額」と読むと 3 項「所得税の額を限度として」と矛盾するが min 実装で排斥、1 項の「その他の政令で定める金額」は doc-comment がスコープ外申告済み; U=政令で定める区分基準日・按分計算・その他の加算額・復興特別所得税/地方税の特例は caller-established／要専門家。
- **限定**: 本レビューは機械的独立クロスチェックであり、**人間の法律レビューではない**。本環境では `lake` / `lean` が PATH になくカーネル再実行は未実施（`by decide` 例は構成上カーネル判定される期待値と独立計算を照合）。一時 Python スクリプトは `D:\CodexData\Temp\advrev_10` に置き削除済み。

### LocalInhabitantTax.lean — 地方税法 市町村民税 art. 314の3（所得割の税率）

- **pinned ids**: law_id `325AC0000000226` / rev `325AC0000000226_20261101_508AC0000000002`（施行 2026-11-01, amend `508AC0000000002`）; `data/raw/325AC0000000226_20261101_508AC0000000002.law.json`（12,181,725 bytes）を独立再計算 → SHA-256 `3DD29E0078BF24E09C79436CE7B0F00FD2CFB5A5BBCB97BD4F4352971BE68D53`（doc-comment と一致, 道府県民税 `LocalIncomeTax.lean` と同一 pin）。`Article attr.Num="314_3"` を 1 件検出、caption「（所得割の税率）」path `(1,2,2,1,2,7)` を **LOCATED**。正規化 leaf 282 文字。原文・Lean は doc-comment / `transcription_audit.py` を信じず raw から直接抽出。
- **独立抽出**: 原文 leaf 正規化後、doc-comment の 3 needle（合計額＋百分の六／指定都市で百分の八／「一の率でなければならない」）が**各 1 回**出現（count=1/1/1）。原文のアラビア数字トークンは段落番号 `２` のみ（率は漢字「百分の六」「百分の八」, 指定都市条文参照は「第二百五十二条の十九第一項」と漢字）。doc-comment は同参照を `252条の19(1)` とアラビア表記に言い換えた**意図的パラフレーズ**であり逐語引用ではないが、指定する条文・率は一致。

  | 原文リテラル | 独立計算 | Lean 定数 | 照合 |
  |---|---|---|---|
  | 「課税総所得金額、課税退職所得金額及び課税山林所得金額の合計額に、百分の六…の標準税率によつて定める率を乗じて得た金額とする。」 | 額 = floor((a+b+c)×6/100) | `localInhabitantIncomeTaxAmount ... false = applyFloor(⟨6,100⟩, a+b+c)` | ✅ |
  | 「…区域内に住所を有する場合には、百分の八）の標準税率によつて…」 | 指定都市は floor((a+b+c)×8/100) | `localInhabitantStandardRate true = ⟨8,100⟩`, amount true | ✅ |
  | 「`第三条…` 地方自治法第二百五十二条の十九第一項の市…（第三百十四条の六及び第三百十四条の七において「指定都市」という。）」 | 指定都市判定は地方自治法依存の外部事実 | Bool `livesInDesignatedCity`（caller-established） | ✅ BY-DESIGN |
  | 「前項の『課税総所得金額』…とは、それぞれ前条の規定による控除後の前年の…金額をいう。」（2 項） | 3 課税標準の定義・算定は本スライ外 | 引数 `taxableTotalIncome taxableRetirementIncome taxableForestIncome` | ✅ BY-DESIGN |
  | 「当該定める率は、一の率でなければならない。」 | 一律率（6% 又 8% の単一率）を適用 | 単一 `TaxRate` を `applyFloor` に渡す | ✅ |
  | 「乗じて得た金額とする。」（端数処理の明示なし）, art.314の6/7・均等割等 | 端数法は明示なし → 切捨てを modeling candidate, 他特例はスコープ外 | `TaxRate.applyFloor`, その他非モデル化（doc-comment 明記） | ✅ BY-DESIGN |
- **反例**: 自前 Python で定式 `amount(a,b,c,d)=((a+b+c)*(8 if d else 6))//100` を再計算し `.lean` / `-Spec` / `-Tests` の全 `by decide` 期待値（新規境界例を含む）と照合 → **全一致, 矛盾 0**。境界: `amount(13,0,0,true)=1`（1..13 の小正入力で 8% が 1 以上になる唯一の点）, `amount(0,0,0,false)=0`, `amount(0,0,0,true)=0`, `amount(10000000,0,0,false)=600000`, `amount(10000000,0,0,true)=800000`, `amount(1000000,1000000,1000000,false)=180000`, `...true=240000`, `amount(24000000,0,0,false)=1440000`, `amount(24000000,0,0,true)=1920000`, `amount(25000000,0,0,false)=1500000`, `amount(25000000,0,0,true)=2000000`, gap `800000−600000=200000`。高所得でも一律率（24.5M/25M で税率変化なし）・単調非減少も確認。
- **判定**: **CONFIRMED 0（原文と Lean の実食い違いなし）**。BY-DESIGN 5: ①指定都市判定（地方自治法 252 条の 19(1)）は caller-established、②3 課税標準（控除後・前年分, art.314の3(2)/art.314の2 依存）は入力、③端数処理は「乗じて得た金額とする」に明示がなく `applyFloor` 切捨てを modeling candidate として採用、④art.314の6/314の7（指定都市の加算・調整）・均等割・外国税額控除等は非モデル化、⑤doc-comment の `252条の19(1)` 表記は原文の漢字表記の意図的言換えで条文・率は一致。**LOCATED, UNRESOLVED なし**。新規境界例（b）`localInhabitantIncomeTaxAmount 13 0 0 true = 1` は 1..13 の小正入力で 8% の切捨て閾値を示す。
- **H/T/D/C/U**: H=6%/8% の取違え・3 課税標準の合計漏れ・他市町村民税特例が混入する; T=3 needle 各1回 + アラビア数字が段落番号のみ + 全 `by decide` 期待値の独立再計算（新規境界例含む）; D=NOT_CONFIRMED（不一致 0, CONFIRMED 0, BY-DESIGN 5）; C=「指定都市は 6% で通常 8%」と逆転読む懸念は原文「百分の六（…指定都市…には、百分の八）」で排斥、3.5M 超の超過税率を想定する懸念は本文に一律率「一の率でなければならない」明記で排斥; U=指定都市該当判定の具体, 控除後課税標準の算定（art.314の2 等）, 端数処理の法的取扱い, 均等割・他特例は caller-established／要専門家。
- **限定**: 本レビューは機械的独立クロスチェックであり、**人間の法律レビューではない**。本環境では `lake` / `lean` が PATH になくカーネル再実行は未実施（`by decide` 例は構成上カーネル判定される期待値と独立計算を照合）。一時 Python スクリプトは `D:\CodexData\Temp\advrev_10` に置き削除済み。
