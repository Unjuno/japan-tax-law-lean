# STAGING TPR — 法人税法施行令 art.157（信託に係る退職年金等積立金額の計算）受け渡しメモ

> 実装担当からメインセッション（統合担当）への受け渡し用。
> commit / push / merge / ブランチ切替は一切していません。
> 書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。

## 0. 対象ファイル

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/TrustPensionReserve.lean` | 新規 |
| `JapanTaxLaw/TrustPensionReserveSpec.lean` | 新規 |
| `JapanTaxLaw/TrustPensionReserveTests.lean` | 新規 |
| `docs/STAGING_TPR.md` | 新規（本ファイル） |

pinned source: law_id `340CO0000000097`（法人税法施行令）/ revision
`340CO0000000097_20261001_507CO0000000121`（amendment enforcement date
2026-10-01; raw snapshot
`data/raw/340CO0000000097_20261001_507CO0000000121.law.json`）。
担当範囲の原文: `C:\Users\junny\AppData\Local\Temp\opencode\C7_157.txt`
（第百五十七条, 本文 LEN 2375、ファイル全体 2396 文字）。
名前空間は `JapanTaxLaw.TrustPensionReserve`（他モジュールと衝突なし）。

## 1. def 一覧（namespace `JapanTaxLaw.TrustPensionReserve`, Money = Nat）

### 1.1 `TrustPensionReserve.lean` — def 2 本 / theorem 7 本 / example 4 本

| def | 式 | 根拠 |
| --- | --- | --- |
| `trustPensionBase first second third fourth` | `(first + second) - (third + fourth)`（saturating Nat） | 第1項「第一号及び第二号に掲げる金額の合計額から第三号及び第四号に掲げる金額の合計額を控除した金額」 |
| `trustPensionReserve first second third fourth adjustmentRate` | `adjustmentRate.applyFloor (trustPensionBase …)` | 第1項「…控除した金額に、調整割合を乗じて計算した金額」。調整割合は caller-established `TaxRate`、端数は `applyFloor`（切り捨て） |

theorem（7 本、いずれもモデル整合性のみ）:

- `trustPensionBase_pos_of_lt` — 控除額 < 加算額なら基準額 > 0。
- `trustPensionBase_eq_zero_of_le` — 加算額 ≤ 控除額なら基準額 = 0（**控除 > 加算で 0 境界**）。
- `trustPensionBase_le_add` — 基準額 ≤ 加算額。
- `trustPensionReserve_eq` — 積立金額 = 基準額 × 調整割合（定式そのもの, rfl）。
- `trustPensionReserve_zero_rate` — 調整割合の分子 0 なら積立金額 0。
- `trustPensionReserve_zero_of_base_zero` — 基準額 0 なら積立金額 0。
- `trustPensionReserve_eq_zero_of_deduction_ge` — 控除 ≥ 加算なら調整割合によらず 0。

caller-established な入力: 第一号〜第四号の各金額（`first/second/third/fourth`）、
調整割合（`adjustmentRate : TaxRate`）、各号・各項の該当性（Bool は金額式に入れない）。

### 1.2 `TrustPensionReserveSpec.lean` — def 7 本 / example 2 本（独立整数定式）

- `specBase first second third fourth` = `if third + fourth ≤ first + second then (first+second)-(third+fourth) else 0`
  （Nat の saturating 減算ではなく明示ガードで書いた独立定式）。
- `specApply num den base` = `base * num / den`（`TaxRate` / `applyFloor` を使わない raw 定式）。
- `specTrustPensionReserve` = `specApply num den (specBase …)`。
- `agreeBasePoint` / `agreeReservePoint`（`hden : 0 < den` を引数に持つ）— 1 点対応。
- `agreeBase`（8 点）/ `agreeReserve`（10 点）— 有限サンプル一致、いずれも `example : … = true := by decide`。

調整割合サンプルは (0/100, 100/100, 107/100, 1/3, 3/7) で、率 0 / 1 / 端数 / 異なり率をカバー。

### 1.3 `TrustPensionReserveTests.lean` — kernel-decide smoke のみ（example 15 本）

基準額: 0・通常値・加算=控除の境界・控除>加算で 0。
積立金額: 調整割合 0 → 0、100/100 → 基準額そのもの、107/100 の端数切り捨て
（`10 → 10`）、`3 * 1 / 2 = 1`、`230 * 3 / 7 = 98`、控除>加算で 0、ゼロ入力。
全て `by decide`。

**合計: def 9 本（main 2 + spec 7）、theorem 7 本（main のみ）、
kernel-decide example 21 本（main 4 + spec 2 + tests 15）。**

## 2. 転記監査 JSON 断片

```json
{
  "law_id": "340CO0000000097",
  "kind": "file",
  "title": null,
  "needles": [
    "最終の財産計算時における第一号及び第二号に掲げる金額の合計額から第三号及び第四号に掲げる金額の合計額を控除した金額に、調整割合を乗じて計算した金額とする。",
    "（信託に係る退職年金等積立金額の計算）第百五十七条法第八十四条第二項第一号イ（退職年金等積立金額の計算）に規定する政令で定めるところにより計算した金額は、",
    "一当該契約に係る信託財産に属する有価証券につき、法第六十一条の三第一項第二号（売買目的外有価証券の原価法により評価した金額）に規定する原価法",
    "二当該契約に係る信託財産に属する金銭の額並びに金銭及び有価証券以外の資産の取得のために要した金額の合計額三当該契約に係る信託財産からの収益の分配でその計算期間",
    "前各項に規定する調整割合とは、百分の七に当該事業年度開始の時までに到来したこれらの規定に規定する信託財産に係る最終の財産計算時の属する日の翌日から",
    "第一号及び第二号に掲げる金額の合計額から第三号に掲げる金額を控除した金額に、調整割合を乗じて計算した金額とする。一当該契約に係る信託財産に属する有価証券につき、原価法により評価した金額"
  ]
}
```

needle は原文から一字も変えず抽出し、**全角空白 U+3000 を含みません**（60〜130 文字）。
既存 `transcription_audit.py` は `yield (name, law_id, kind, title, [needles])` 形式なので、
統合時は上記 6 本をそのタプルへ移してください（needle 文字列は一字も変えないこと）。
`kind: "file"` は既存監査のロケータ種別に合わせたもので、本文は `Article Num == '157'` で定位。

## 3. 検証結果（すべて本セッションで実行済み）

1. **build**: `lake build JapanTaxLaw.TrustPensionReserve JapanTaxLaw.TrustPensionReserveSpec JapanTaxLaw.TrustPensionReserveTests`
   → `Build completed successfully (5 jobs)`。自作 3 モジュールのみ。全体ビルド／CI は未実行。
2. **no-sorry gate**: `python scripts/ci/check_no_sorry.py` →
   `no forbidden placeholder proofs found in tracked Lean sources`。
   加えて新規 3 ファイル（未追跡のため gate 対象外）を checker 自身の
   `strip_comments_and_strings` / `FORBIDDEN` で直接走査 → hits **0**。
3. **axiom probe**: 一時 Lean ファイルに 3 モジュールの名前付き宣言 **16** 件（def 9 + theorem 7）を
   列挙し `lake env lean`（exit code 0）で `#print axioms`。結果: axiom-free **11** 件、
   `propext` のみ **5** 件（許可、`trustPensionBase_pos_of_lt` /
   `trustPensionBase_eq_zero_of_le` / `trustPensionReserve_zero_rate` /
   `trustPensionReserve_zero_of_base_zero` / `trustPensionReserve_eq_zero_of_deduction_ge`）、
   `Classical.choice` / `sorryAx` / `Quot.sound` は **0** 件。
   一時ファイル（`_tpr_axiom_probe.lean` / `_tpr_axiom_out.txt`）は削除済み。
4. **逐語（needle）**: pinned JSON の `MainProvision` 配下 `Article Num == '157'` の本文
   leaf-text を連結し `re.sub(r"[\s　]+", "", …)` で正規化（正規化後 2375 字、
   原文 C7 と一致）。各 needle に Python `.find()` を実行。

   | # | needle（先頭） | 文字数 | U+3000 | `.find()`（正規化 JSON） | `.find()`（原文 C7） |
   |---|---|---|---|---|---|
   | 1 | 最終の財産計算時における第一号及び第二号に掲げる金額の合計額から… | 77 | なし | 149 | 170 |
   | 2 | （信託に係る退職年金等積立金額の計算）第百五十七条法第八十四条… | 77 | なし | 0 | 21 |
   | 3 | 一当該契約に係る信託財産に属する有価証券につき、法第六十一条の三… | 70 | なし | 226 | 247 |
   | 4 | 二当該契約に係る信託財産に属する金銭の額並びに金銭及び有価証券… | 79 | なし | 382 | 403 |
   | 5 | 前各項に規定する調整割合とは、百分の七に当該事業年度開始の時までに… | 73 | なし | 1967 | 1988 |
   | 6 | 第一号及び第二号に掲げる金額の合計額から第三号に掲げる金額を控除した… | 92 | なし | 1379 | 1400 |

   （原文 C7 のオフセットは先頭 21 文字のヘッダ
   `==== 第百五十七条 LEN 2375\n` の分だけ正規化 JSON とずれる。）
   law_id `340CO0000000097` / revision `340CO0000000097_20261001_507CO0000000121` 一致確認。
   **FOUND 6 / MISS 0**; アンカーの勝手な変更なし。

## 4. Integration — 3 imports 明示

Integrator adds these 3 imports to `JapanTaxLaw.lean`（本ワーカーは同ファイルを変更しない）:

```lean
import JapanTaxLaw.TrustPensionReserve
import JapanTaxLaw.TrustPensionReserveSpec
import JapanTaxLaw.TrustPensionReserveTests
```

## 5. README / PROGRESS 1行文案

- README: `TrustPensionReserve — 法人税法施行令 art.157 第1項の算術（基準額 =（第一号+第二号）−（第三号+第四号）, saturating Nat, 積立金額 = 基準額 × caller-established 調整割合 TaxRate を applyFloor で切り捨て）を bounded L4 でモデル化（各号金額・調整割合・該当性は caller-established）。`
- PROGRESS: `Added TrustPensionReserve{,,Spec,,Tests}: art.157(1) (第一号+第二号)−(第三号+第四号) + TaxRate.applyFloor; def 9/theorem 7, 21 kernel-decide examples; 16 decls axiom-probed (11 axiom-free, propext only 5); 6 verbatim needles FOUND/MISS 0; integration 3 imports pending.`

## 6. Honest scope / NOT MODELLED

小さな L4 スライスであり、**完成・網羅を主張しない**。人間の法的レビューではない。

- **NOT MODELLED（各号の具体的算定）**: 第一号の「原価法」による評価
  （法61条の3第1項第二号参照、償還期限・償還金額のある有価証券の帳簿価額の扱い）、
  第二号の金銭の額・金銭及び有価証券以外の資産の取得のために要した金額、
  第三号の収益の分配（計算期間の終了判定）、第四号の掛金の総額・加入者負担部分・
  加入者負担掛金割合を用いた控除額、およびこれらにともなう他条文参照は、
  外部の評価・契約情報・他条文に依存するため対象外。`first/second/third/fourth` は
  caller が算定した値として受け取る。
- **NOT MODELLED（調整割合の算定）**: 第5項の「百分の七に…月数を乗じてこれを十二で除して
  計算した割合に百分の百を加えた割合」の算定、第6項の月数の端数切り捨ては、
  事業年度・最終財産計算日の情報に依存するため対象外。`adjustmentRate` は
  caller-established `TaxRate` として受け取り、本モジュールでは算定しない。
- **第2項**: 算術は第1項と同一（（第一号+第二号）−（第三号+第四号））なので同じ def で
  表現できるが、契約種別（確定給付年金基金資産運用契約）の該当性判定は行わない。
- **第3項・第4項**: （第一号+第二号）−第三号（第四号なし）という異なる算術式であり、
  本スライス（第1項・第2項の bounded モデル）の射程外。
- **第7項・第8項**（引継ぎ時の読替え）も NOT MODELLED。
- 丸めは `TaxRate.applyFloor`（切り捨て）を modeling choice として採用した。
- `agree*` は代表サンプル上の一致確認であり、全入力域での等価証明ではない。
- **L7 候補 3438 件は LEGAL_REVIEW_PENDING / unreviewed のまま**（本スライスでは一切レビューしていない）。
  `docs/L7_CANDIDATES_UNREVIEWED.csv` / `docs/RECURSIVE_DISCOVERY.md` は変更していない。
- commit / push / merge / ブランチ切替は行っていない。
