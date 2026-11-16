# STAGING — W-C (登録免許税法 別表第一（二）第三十二号 七十六〜八十二) 受け渡しメモ

> 実装担当 W-C からメインセッション（統合担当）への受け渡し用。
> ブランチ操作・add/commit/push/merge は一切していません。
> 書き換えたのは下記 4 ファイルのみです（他は読み取り専用）。

## 0. 対象ファイル

| ファイル | 状態 |
| --- | --- |
| `JapanTaxLaw/RegistrationQualificationFeesP3C.lean` | 新規 |
| `JapanTaxLaw/RegistrationQualificationFeesP3CSpec.lean` | 新規 |
| `JapanTaxLaw/RegistrationQualificationFeesP3CTests.lean` | 新規 |
| `docs/STAGING_WC.md` | 新規（本ファイル） |

pinned source: `data/raw/342AC0000000035_20261101_508AC0000000021.law.json`
law id `342AC0000000035` / revision `342AC0000000035_20261101_508AC0000000021`
section 開始マーカー: `"三十二　人の資格の登録若しくは認定又は技能証明"`（`\u3000` は全角空白）。
（RegistrationQualificationFees.lean / -P2A / -P2B と同一ピン。）

## 1. def 一覧（名前 → 金額 → 条号／区分）

### 1.1 `RegistrationQualificationFeesP3C.lean`（namespace `JapanTaxLaw`、`Money := Nat`）

| def | 条号／区分 | 金額 |
| --- | --- | --- |
| `mentalHealthTrainingInstRegFee` | 七十六 精神保健及び精神障害者福祉に関する法律第十八条第一項第四号／第十九条第一項（登録研修機関の登録） | 90,000 |
| `pharmaMarketingLicenseFee` | 七十七（一） 医薬品医療機器等法第十二条第一項（製造販売業の許可） | 150,000 |
| `pharmaManufactureLicenseFee` | 七十七（二） 同法第十三条第一項（製造業の許可）／同条第八項 区分追加 | 90,000 |
| `pharmaStorageOnlyFacilityRegFee` | 七十七（三） 同法第十三条の二の二第一項（保管のみを行う製造所の登録） | 90,000 |
| `pharmaForeignManufacturerCertFee` | 七十七（四） 同法第十三条の三第一項（医薬品等外国製造業者の認定） | 90,000 |
| `pharmaForeignStorageOnlyRegFee` | 七十七（五） 同法第十三条の三の二第一項（外国製造業者の保管のみを行う製造所の登録） | 90,000 |
| `medicalDeviceMarketingLicenseFee` | 七十七（六） 同法第二十三条の二第一項（医療機器の製造販売業の許可） | 150,000 |
| `medicalDeviceManufactureRegFee` | 七十七（七） 同法第二十三条の二の三第一項（医療機器等の製造の事業の登録） | 90,000 |
| `medicalDeviceForeignManufacturerRegFee` | 七十七（八） 同法第二十三条の二の四第一項（医療機器等外国製造業者の登録） | 90,000 |
| `regenProductMarketingLicenseFee` | 七十七（九） 同法第二十三条の二十第一項（再生医療等製品の製造販売の事業の許可） | 150,000 |
| `regenProductManufactureLicenseFee` | 七十七（十） 同法第二十三条の二十二第一項（再生医療等製品の製造業の許可） | 90,000 |
| `regenProductForeignManufacturerCertFee` | 七十七（十一） 同法第二十三条の二十四第一項（再生医療等製品外国製造業者の認定） | 90,000 |
| `medicalDeviceRepairLicenseFee` | 七十七（十二） 同法第四十条の二第一項（医療機器の修理業の許可） | 90,000 |
| `pmdActDeemedLicenseFee` | 七十七（十三） 同法第八十三条第一項の読み替え適用による許可・認定・登録 | 90,000 |
| `deviceCertificationBodyRegFee` | 七十七（十四） 同法第二十三条の二の二十三第一項（登録認証機関の登録） | 90,000 |
| `specificCellProcessProductMfgLicenseFee` | 七十七の二（一） 再生医療等の安全性の確保等に関する法律第三十五条第一項（特定細胞加工物等の製造の許可） | 90,000 |
| `foreignCellProcessProductCertFee` | 七十七の二（二） 同法第三十九条第一項（外国における特定細胞加工物等の製造の認定） | 90,000 |
| `careManagerExamQuestionBodyRegFee` | 七十八 介護保険法第六十九条の十一第一項（登録試験問題作成機関の登録） | 150,000 |
| `dcPensionMgmtBusinessRegFee` | 七十九 確定拠出年金法第八十八条第一項（登録） | 90,000 |
| `homeWorkSupportOrgRegFee` | 八十 障害者の雇用の促進等に関する法律第七十四条の三第一項（在宅就業支援団体の登録） | 15,000 |
| `feeChargingJobPlacementPermitFee` | 八十一（一） 職業安定法第三十条第一項（有料の職業紹介事業の許可） | 90,000 |
| `workerDispatchingPermitFee` | 八十一（二） 労働者派遣事業法第五条第一項（労働者派遣事業の許可） | 90,000 |
| `portWorkerDispatchPermitFee` | 八十一（三） 港湾労働法第十二条第一項（港湾労働者派遣事業の許可） | 90,000 |
| `portDispatchScopeChangePermitFee` | 八十一（四） 港湾労働法第十八条第一項（派遣事業対象業務の種類の変更等、港湾ごとの増加に限る） | 15,000 |
| `constructionJobPlacementPermitFee` | 八十一（五） 建設労働者の雇用の改善等に関する法律第十八条第一項（建設業務有料職業紹介事業の許可） | 90,000 |
| `constructionEmploymentOpportunityPermitFee` | 八十一（六） 同法第三十一条第一項（建設業務労働者就業機会確保事業の許可） | 90,000 |
| `careerCounselorExamBodyRegFee` | 八十一の二 職業能力開発促進法第三十条の五第一項（登録試験機関の登録） | 150,000 |
| `buildingEnvMgmtCourseRegFee` | 八十二 建築物における衛生的環境の確保に関する法律第七条第一項第一号（登録講習機関の登録） | 90,000 |

- count: **28 defs / 28 positivity theorems / 28 impl smoke examples**。
- 金額内訳: 150,000 × 6件（七十七(一)(六)(九)・七十八・八十一の二）、15,000 × 2件（八十・八十一(四)）、90,000 × 20件。日本語数字（十五万円／一万五千円／九万円）を Arabic に変換し、全件一致を確認済み（§4）。
- **八十一（注）のみなし規定は金額なし。fee def も needle も作っていません。**

### 1.2 `RegistrationQualificationFeesP3CSpec.lean`
- 上記 28 def に対応する `spec*` 独立定式 28 本（金額は同一）。
- `agreeRegistrationQualificationFeesP3C : Bool` — impl と spec の全 28 項目を `==` 比較。
  `example : agreeRegistrationQualificationFeesP3C = true := by decide`。

### 1.3 `RegistrationQualificationFeesP3CTests.lean`
- `example := by decide` のスモーク 28 本のみ（定理名の追加なし）。

### 1.4 doc-comment に明記した射程外（overclaim 防止）
- 「更新の登録／許可／認定を除く。」「政令で定めるものに限り」「第八十三条第一項の規定により
  読み替えて適用する場合を含む。」「港湾ごとの派遣事業対象業務の種類の増加に係るものに限る。」
  等の適用判定は **caller-established** とし、金額定数には反映していません（Bool を式に入れない）。
- 八十一（注）の高年齢者等の雇用の安定等に関する法律第三十八条第二項／第三項のみなし規定は
  デーミング規定で金額なし。doc-comment に記載するのみで fee def を作っていません。
- 七十五 以前（W-A / W-B スライプ）は NOT YET COVERED。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり法的正しさを保証しません。

### 1.5 担当範囲のカテゴリ一覧（七十六〜八十二）

| 区分 | 件数 | 内容 |
| --- | --- | --- |
| 七十六 | 1 | 精神保健指定医に係る登録研修機関の登録 |
| 七十七 | 14 | 医薬品等の製造販売業・製造業・修理業の許可／認定／登録、指定高度管理医療機器等の登録認証機関の登録 |
| 七十七の二 | 2 | 特定細胞加工物等の製造の許可、外国における特定細胞加工物等の製造の認定 |
| 七十八 | 1 | 介護支援専門員実務研修受講試験に係る登録試験問題作成機関の登録 |
| 七十九 | 1 | 確定拠出年金運営管理業の登録 |
| 八十 | 1 | 在宅就業支援団体の登録 |
| 八十一 | 6 | 有料職業紹介・労働者派遣・港湾労働者派遣・派遣対象業務変更・建設業務有料職業紹介・建設業務就業機会確保（＋注のみなし規定は金額なし） |
| 八十一の二 | 1 | キャリアコンサルタントに係る登録試験機関の登録 |
| 八十二 | 1 | 建築物環境衛生管理技術者免状に係る登録講習機関の登録 |
| **合計** | **28** | — |

## 2. 転記監査に追加すべき check（JSON 断片）

`scripts/ci/transcription_audit.py` の `checks()` に追加する check の完全な JSON 表現です
（`law_id` / `kind` / `title` / `needles` の 4 キー）。needle 文字列は一字も変えないこと。

```json
{
  "law_id": "342AC0000000035",
  "kind": "file",
  "title": null,
  "needles": [
    "七十六精神保健指定医に係る登録研修機関の登録精神保健及び精神障害者福祉に関する法律（昭和二十五年法律第百二十三号）第十八条第一項第四号（登録研修機関の登録）又は第十九条第一項（登録研修機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "の第一種医薬品製造販売業許可、第二種医薬品製造販売業許可、医薬部外品製造販売業許可又は化粧品製造販売業許可（政令で定めるものに限り、更新の許可を除く。）許可件数一件につき十五万円",
    "（二）医薬品医療機器等法第十三条第一項（製造業の許可）の医薬品、医薬部外品若しくは化粧品の製造業の許可又は同条第八項の規定による製造所に係る許可の区分の追加の許可（政令で定めるものに限り、更新の許可を除く。）許可件数一件につき九万円",
    "（三）医薬品医療機器等法第十三条の二の二第一項（保管のみを行う製造所に係る登録）の医薬品、医薬部外品又は化粧品の保管のみを行う製造所の登録（政令で定めるものに限り、更新の登録を除く。）登録件数一件につき九万円",
    "（四）医薬品医療機器等法第十三条の三第一項（医薬品等外国製造業者の認定）の医薬品等外国製造業者の認定又は同条第三項において準用する医薬品医療機器等法第十三条第八項の規定による製造所に係る認定の区分の追加の認定（更新の認定を除く。）認定件数一件につき九万円",
    "（五）医薬品医療機器等法第十三条の三の二第一項（医薬品等外国製造業者の保管のみを行う製造所に係る登録）の医薬品等外国製造業者の保管のみを行う製造所の登録（更新の登録を除く。）登録件数一件につき九万円",
    "の第一種医療機器製造販売業許可、第二種医療機器製造販売業許可、第三種医療機器製造販売業許可又は体外診断用医薬品製造販売業許可（政令で定めるものに限り、更新の許可を除く。）許可件数一件につき十五万円",
    "（七）医薬品医療機器等法第二十三条の二の三第一項（製造業の登録）の医療機器又は体外診断用医薬品の製造の事業の登録（政令で定めるものに限り、更新の登録を除く。）登録件数一件につき九万円",
    "（八）医薬品医療機器等法第二十三条の二の四第一項（医療機器等外国製造業者の登録）の医療機器等外国製造業者の登録（更新の登録を除く。）登録件数一件につき九万円",
    "（九）医薬品医療機器等法第二十三条の二十第一項（製造販売業の許可）（医薬品医療機器等法第八十三条第一項の規定により読み替えて適用する場合を含む。）の再生医療等製品の製造販売の事業の許可（政令で定めるものに限り、更新の許可を除く。）許可件数一件につき十五万円",
    "（十）医薬品医療機器等法第二十三条の二十二第一項（製造業の許可）の再生医療等製品の製造業の許可又は同条第八項の規定による製造所に係る許可の区分の追加の許可（政令で定めるものに限り、更新の許可を除く。）許可件数一件につき九万円",
    "同条第三項において準用する医薬品医療機器等法第二十三条の二十二第八項の規定による製造所に係る認定の区分の追加の認定（更新の認定を除く。）認定件数一件につき九万円",
    "（十二）医薬品医療機器等法第四十条の二第一項（医療機器の修理業の許可）の医療機器の修理業の許可又は同条第七項の規定による事業所に係る修理区分の追加の許可（政令で定めるものに限り、更新の許可を除く。）許可件数一件につき九万円",
    "第四十条の二第一項若しくは第七項の規定による許可、認定又は登録（政令で定めるものに限り、更新の許可、認定又は登録を除く。）許可件数、認定件数又は登録件数一件につき九万円",
    "（十四）医薬品医療機器等法第二十三条の二の二十三第一項（登録認証機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円",
    "第三十五条第一項（特定細胞加工物等の製造の許可）の特定細胞加工物等の製造の許可（更新の許可を除く。）許可件数一件につき九万円",
    "第三十九条第一項（外国における特定細胞加工物等の製造の認定）の外国における特定細胞加工物等の製造の認定（更新の認定を除く。）認定件数一件につき九万円",
    "七十八介護支援専門員実務研修受講試験に係る登録試験問題作成機関の登録介護保険法（平成九年法律第百二十三号）第六十九条の十一第一項（登録試験問題作成機関の登録）の登録登録件数一件につき十五万円",
    "七十九確定拠出年金運営管理業の登録確定拠出年金法（平成十三年法律第八十八号）第八十八条第一項（登録）の確定拠出年金運営管理業の登録登録件数一件につき九万円",
    "八十在宅就業支援団体の登録障害者の雇用の促進等に関する法律（昭和三十五年法律第百二十三号）第七十四条の三第一項（在宅就業支援団体の登録）の登録（更新の登録を除く。）登録件数一件につき一万五千円",
    "有料の職業紹介事業の許可とみなす。（一）職業安定法第三十条第一項の有料の職業紹介事業の許可（更新の許可を除く。）許可件数一件につき九万円",
    "（二）労働者派遣事業の適正な運営の確保及び派遣労働者の保護等に関する法律（昭和六十年法律第八十八号）第五条第一項（労働者派遣事業の許可）の労働者派遣事業の許可（更新の許可を除く。）許可件数一件につき九万円",
    "（三）港湾労働法（昭和六十三年法律第四十号）第十二条第一項（港湾労働者派遣事業の許可）の港湾労働者派遣事業の許可（更新の許可を除く。）許可件数一件につき九万円",
    "（四）港湾労働法第十八条第一項（派遣事業対象業務の種類の変更等）の変更の許可（同法第十二条第二項第四号の港湾ごとの派遣事業対象業務の種類の増加に係るものに限る。）許可件数一件につき一万五千円",
    "（五）建設労働者の雇用の改善等に関する法律（昭和五十一年法律第三十三号）第十八条第一項（建設業務有料職業紹介事業の許可）の建設業務有料職業紹介事業の許可（更新の許可を除く。）許可件数一件につき九万円",
    "（六）建設労働者の雇用の改善等に関する法律第三十一条第一項（建設業務労働者就業機会確保事業の許可）の建設業務労働者就業機会確保事業の許可（更新の許可を除く。）許可件数一件につき九万円",
    "八十一の二キャリアコンサルタントに係る登録試験機関の登録職業能力開発促進法第三十条の五第一項（登録試験機関の登録）の登録登録件数一件につき十五万円",
    "八十二建築物環境衛生管理技術者免状に係る登録講習機関の登録建築物における衛生的環境の確保に関する法律（昭和四十五年法律第二十号）第七条第一項第一号（登録講習機関の登録）の登録（更新の登録を除く。）登録件数一件につき九万円"
  ]
}
```

> **重要（統合時の注意）**: needle は原文 pinned bytes の一字一句です。
> 文字正規化・全角／半角変換・異体字変換を行わず、そのまま移してください。
> §5 の検証で実際に `.find()` したのは、まさに上記 28 文字列です（`_norm` は
> 空白・全角空白を除去するだけなので、needle 中の文字は一切変換していません）。
> 長さは 62〜128 文字で、いずれも区分／条号を含む一意な文字列です。

参考：現行スクリプト形式への変換例（name は任意）:

```python
yield ("登録免許税法 別表第一（二）第三十二号 七十六〜八十二（医薬品等・特定細胞加工物等・職業紹介等）↔ RegistrationQualificationFeesP3C.lean",
       "342AC0000000035",
       "file", None,
       [
         # ↑ の JSON の needles 配列 28 本をそのまま列挙
       ])
```

## 3. 期待 literal 増分

- 新規 check 1 件 × needles **28 本**なので **+28**。
- needle 数 = fee def 数 = 28（八十一（注）は金額なしのため needle なし）。
- `docs/PROGRESS.md` §7 の記載値（W-B 時点で 416 literal / 32 anchor チェック）に
  W-A(+?) と本スライス(+28) が加算される見込み。起点は文書記載値なので、
  実際の現在値はメインセッションで再確認してください。

## 4. 検証結果（すべて本セッションで実行済み）

- `lake build JapanTaxLaw.RegistrationQualificationFeesP3C JapanTaxLaw.RegistrationQualificationFeesP3CSpec JapanTaxLaw.RegistrationQualificationFeesP3CTests`
  → **成功（5 jobs、warning なし）**。※自作 3 モジュールのみビルド（全体ビルド・CI は未実行）。
- `python scripts/ci/check_no_sorry.py` → `no forbidden placeholder proofs found in tracked Lean sources`。
  （新規 3 ファイルは未追跡のため本スクリプトの走査対象外ですが、人力でも `sorry` / `admit` はありません。）
- `#print axioms`（一時ファイル `WCAxiomProbe.lean` を approved temp dir に作成、
  `lake env lean` で実行後 **削除済み**）:
  - 28 本の `*_pos` 定理と `agreeRegistrationQualificationFeesP3C` の **全 29 件が
    "does not depend on any axioms"**。
  - **`Classical.choice` も `sorryAx` も `propext` も一切なし**。
- 金額一致検証: 28 本の needle 末尾の日本語金額（九万円／十五万円／一万五千円）を
  Arabic（90,000／150,000／15,000）に変換し、対応する 28 def の `Money` 値と突き合わせ →
  **28/28 一致、不一致 0 件**。
- 原文逐語検証: 下記 §5 のとおり **28/28 FOUND、MISS 0 件**。各 needle の正規化テキスト中
  出現回数はすべて **1**（一意）。

## 5. 逐語検証 FOUND / MISS 一覧（一字も変更せず）

pinned JSON の `law_full_text` を `transcription_audit.py` の `text()` と同一ロジックで平坦化し、
`_norm` と同じ `re.sub(r"[\s　]+", "", ...)` で正規化した文字列に対して各 needle を Python の
`.find()` で検索（needle 側も同正規化）。`law id 342AC0000000035` および source_file 名の
revision も一致確認済み。

| # | def | 結果 | len | 出現回数(norm) | offset(norm) |
| --- | --- | --- | --- | --- | --- |
| 1 | mentalHealthTrainingInstRegFee | FOUND | 124 | 1 | 161406 |
| 2 | pharmaMarketingLicenseFee | FOUND | 89 | 1 | 161727 |
| 3 | pharmaManufactureLicenseFee | FOUND | 116 | 1 | 161816 |
| 4 | pharmaStorageOnlyFacilityRegFee | FOUND | 104 | 1 | 161932 |
| 5 | pharmaForeignManufacturerCertFee | FOUND | 127 | 1 | 162036 |
| 6 | pharmaForeignStorageOnlyRegFee | FOUND | 99 | 1 | 162163 |
| 7 | medicalDeviceMarketingLicenseFee | FOUND | 98 | 1 | 162334 |
| 8 | medicalDeviceManufactureRegFee | FOUND | 91 | 1 | 162432 |
| 9 | medicalDeviceForeignManufacturerRegFee | FOUND | 78 | 1 | 162523 |
| 10 | regenProductMarketingLicenseFee | FOUND | 128 | 1 | 162601 |
| 11 | regenProductManufactureLicenseFee | FOUND | 112 | 1 | 162729 |
| 12 | regenProductForeignManufacturerCertFee | FOUND | 80 | 1 | 162903 |
| 13 | medicalDeviceRepairLicenseFee | FOUND | 111 | 1 | 162983 |
| 14 | pmdActDeemedLicenseFee | FOUND | 84 | 1 | 163319 |
| 15 | deviceCertificationBodyRegFee | FOUND | 64 | 1 | 163403 |
| 16 | specificCellProcessProductMfgLicenseFee | FOUND | 62 | 1 | 163545 |
| 17 | foreignCellProcessProductCertFee | FOUND | 74 | 1 | 163629 |
| 18 | careManagerExamQuestionBodyRegFee | FOUND | 95 | 1 | 163703 |
| 19 | dcPensionMgmtBusinessRegFee | FOUND | 77 | 1 | 163798 |
| 20 | homeWorkSupportOrgRegFee | FOUND | 96 | 1 | 163875 |
| 21 | feeChargingJobPlacementPermitFee | FOUND | 68 | 1 | 164150 |
| 22 | workerDispatchingPermitFee | FOUND | 102 | 1 | 164218 |
| 23 | portWorkerDispatchPermitFee | FOUND | 79 | 1 | 164320 |
| 24 | portDispatchScopeChangePermitFee | FOUND | 95 | 1 | 164399 |
| 25 | constructionJobPlacementPermitFee | FOUND | 99 | 1 | 164494 |
| 26 | constructionEmploymentOpportunityPermitFee | FOUND | 91 | 1 | 164593 |
| 27 | careerCounselorExamBodyRegFee | FOUND | 73 | 1 | 164684 |
| 28 | buildingEnvMgmtCourseRegFee | FOUND | 110 | 1 | 164757 |

- **FOUND 28 件 / MISS 0 件。** アンカーの勝手な変更・正規化はしていません。
- 八十一（注）には金額规定がないため needle を作っていません（上記 28 本は担当分すべて）。

## 6. README / PROGRESS に足す 1 行文案

CROSS_LAW の scan/pin 件数はメインセッションが計算するため、ここでは書きません。

- **README.md**（モジュール一覧・`RegistrationQualificationFeesP2B*` 3 行の直後に追加）:
  ```text
  JapanTaxLaw/RegistrationQualificationFeesP3C.lean / -Spec.lean / -Tests.lean  # 登録免許税法 別表第一（二）第三十二号 七十六〜八十二（医薬品等・特定細胞加工物等・介護／年金／就業支援・職業紹介等）flat fee L4 モデル・独立定式・退行テスト
  ```
- **docs/PROGRESS.md**（L4 着手済みモジュール一覧の末尾に追記）:
  ```text
  登録免許税法 別表第一（二）第三十二号 七十六〜八十二 RegistrationQualificationFeesP3C.lean（医薬品等 14 件・特定細胞加工物等 2 件・職業紹介／派遣 6 件等の flat fee、八十一（注）はみなし規定で金額なし、七十五 以前 NOT YET COVERED）
  ```

## 7. インテグレーターへの明示事項

**インテグレーターは `JapanTaxLaw.lean` に以下の 3 つの import を追加すること。**

```lean
import JapanTaxLaw.RegistrationQualificationFeesP3C
import JapanTaxLaw.RegistrationQualificationFeesP3CSpec
import JapanTaxLaw.RegistrationQualificationFeesP3CTests
```

（W-A / W-B の `RegistrationQualificationFeesP2A*` / `P2B*` 各 3 件と併せて計 9 行の追加になる見込みです。
メインが統合してください。W-C は `JapanTaxLaw.lean` を書き換えていません。）

## 8. 範囲・残ブロッカーの正直な申告

- これは **L4 のごく小さなスライス**です。**完成・網羅を主張しません**。
- 担当は 別表第一（二）第三十二号 **七十六〜八十二** のみ（28 件）。
  **八十一（注）はみなし規定で金額なし**、**七十五 以前は NOT YET COVERED**。
- 「政令で定めるものに限る」「更新の登録を除く。」「読み替えて適用する」
  「港湾ごとの派遣事業対象業務の種類の増加に係るものに限る。」等の適用判定は
  caller-established であり、法的判断の自動化はしていません。
- 転記監査は fidelity-only（原文 bytes との一致確認）であり、法的正しさを保証しません。
- **L7 候補 3,438 件は unreviewed のまま**です（本スライスでは一切レビューしていません）。
- 残ブロッカー: 転記監査 check の `checks()` への組み込み（§2）、`JapanTaxLaw.lean` への
  import 追加（§7）、README / PROGRESS の 1 行追記（§6）、および全体ビルド・CI ゲートの
  実行は**すべてメインセッションの担当**です（W-C は実行していません）。
