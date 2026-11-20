### SpouseResidenceValuation.lean — 相続税法 第二十三条の二

- **pinned ids**: law_id `325AC0000000073` / rev `325AC0000000073_20260401_506AC0000000008`（施行 2026-04-01, amend `506AC0000000008`）; `data/raw/325AC0000000073_20260401_506AC0000000008.law.json` を独立再計算 → SHA-256 `c01bb9be910ce849c82e26f1dd5d262ddf5bb55a1bf042512451460f275043a7`。自前 Python で `law_full_text` を再帰 flatten し `Article attr.Num="23_2"`（path `(1,3,2,3)`, caption「配偶者居住権等の評価」）を locate → **LOCATED**。原文 leaf 1187 文字（U+3000/空白正規化後も 1187）の SHA-256 `d65eea1d23b971901e22e8c62f33f2aff168542f4ca3c15a7c9b6c4a65b77898`。Lean doc-comment の原文 1187 文字と **逐語一致（TRANSCRIPTION_EXACT=true）**。doc-comment / transcription_audit.py は信じず raw から独立抽出。
- **独立抽出**:
  | 原文リテラル | 独立計算 | Lean 定数 | 照合 |
  |---|---|---|---|
  | 「第一号に掲げる価額から同号に掲げる価額に第二号に掲げる数及び第三号に掲げる割合を乗じて得た金額を控除した残額」 | A − A×数×割合 | `spouseResidenceValue b r q = b - b*r*q` | ✅ |
  | 「イに掲げる年数をロに掲げる年数で除して得た数（イ又はロに掲げる年数が零以下である場合には、零）」 | 数=イ÷ロ, イ=0 又 ロ=0 → 0, 端数切捨 | `yearsRate i ro = if i=0||ro=0 then 0 else i/ro` | ✅ |
  | 「耐用年数…から建築後の経過年数…及び…存続年数を控除した年数」(イ) / 「耐用年数から建築後の経過年数を控除した年数」(ロ) | ロ=耐用−経過, イ=耐用−経過−存続, 零下限 | `remainingYears` / `netBuildingYears` | ✅ |
  | 「時価から前項の規定により計算した当該配偶者居住権の価額を控除した残額」(2項) | 時価−居住権価額 | `residenceBuildingValue m v = m - v` | ✅ |
  | 「前号に掲げる価額に第一項第三号に掲げる割合を乗じて得た金額」(3項二号)／「時価から…権利の価額を控除した残額」(4項) | L − L×割合 / 時価−使用権価額 | `landUseRightValue` / `landValueAfterUseRight` | ✅ |
  | 「六月以上の端数は一年とし、六月に満たない端数は切り捨てる」「政令で定める」「財務省令で定める」 | 政令・省令依存のため非モデル化（明示） | コーラー確立 Nat / BY-DESIGN | ✅ BY-DESIGN |
- **反例**: 独立 Python 再計算 22 点を `.lean`/`-Spec`/`-Tests` の全 `by decide` 期待値と照合し全一致。境界例: `remainingYears(10,30)=0`（零以下）, `netBuildingYears(30,10,5)=15`（イ=15,ロ=20）, `yearsRate(15,20)=0`（端数切捨）, `yearsRate(20,0)=0`（ロ零）, `spouseResidenceValue(1000,1,2)=0`（控除>時価→saturating）, `spouseResidenceValue(1000,0,3)=1000`, `residenceBuildingValue(300,1000)=0`, `landUseRightValue(1000,0)=1000`, `landValueAfterUseRight(300,1000)=0`。矛盾 0。
- **判定**: **CONFIRMED 0（原文と Lean の実食い違いなし）**。BY-DESIGN 5: ①一部賃貸・共有持分の按分（政令）は非モデル化・時価は caller-established、②耐用年数・経過年数の六月端数処理・存続年数（政令）は非モデル化で `remainingYears` は零下限構造のみ、③三号割合（財務省令・法定利率複利現価率）・除数・時価は caller-established Nat、④「除して得た数」を Nat 整数除算（切捨）で表現、⑤控除>時価を saturating 零とする（Nat 化に伴う選択）。Doc-comment のスコープ申告と整合。
- **H/T/D/C/U**: H=各項の控除式・二号の数（イ÷ロ, 零下限）が原文と食い違う; T=原文 leaf 全文逐語一致 + 22 点独立再計算⇔全 `by decide`; D=NOT_CONFIRMED（不一致 0, LOCATED, BY-DESIGN 5）; C=「イをロで除す」をロ÷イと読む解釈は原文「イに掲げる年数をロに掲げる年数で除して」で排斥; U=小数割合(0<割合<1)・政令/省令で定める具体値・端数処理の法的取扱いは caller-established／要専門家。
- **限定**: 本レビューは機械的独立クロスチェックであり、**人間の法律レビューではない**。注: 本環境では `lake`/`lean` が PATH になくカーネル再実行は未実施（`by decide` 例は構成上カーネル判定される期待値と独立計算を照合）。一時 Python スクリプトは `D:\CodexData\Temp\opencode\_adv_srv` に置き削除済み。UNRESOLVED なし。
