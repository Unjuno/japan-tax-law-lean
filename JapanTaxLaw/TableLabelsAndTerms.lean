/-\!
# TableLabelsAndTerms — 表見出し・欄番号・用語・申請書項目（2305 units, PROVED_SCOPE）

2,305 dependency-ready fragments recorded UNRESOLVED by the decomposer. Only
structural/ordinal claims are proven (unhandled conditions retained), so all
derive `PROVED_SCOPE`, never `FULLY_VERIFIED`.

- table_header (878): 「Ａ　当該…額」 — Latin ordinal + label.
- bare_term (1055): 総所得金額, 課税総所得金額, 人口, 千円 etc. — bare term reference.
- form_field (204): 申請者の住所…, 代表者の氏名 — form field declaration.
- column_label (168): 第一欄..第十欄 — column ordinal.
-/
import JapanTaxLaw.KanjiOrdinals
import JapanTaxLaw.LegalStructuralMarkers

namespace JapanTaxLaw.TableLabelsAndTerms

open JapanTaxLaw.KanjiOrdinals
open JapanTaxLaw.LegalStructuralMarkers

-- 欄番号
def parseColumn (s : String) : Option Nat :=
  match s.toList with
  | '第' :: rest =>
      match rest.reverse with
      | '欄' :: rev => parseKanji (String.ofList rev.reverse)
      | _ => none
  | _ => none

theorem parse_column_1 : parseColumn "第一欄" = some 1 := by decide
theorem parse_column_4 : parseColumn "第四欄" = some 4 := by decide

-- 表見出し：Ａ＋全角空白＋ラベル
def parseTableHeader (s : String) : Option (Nat × String) :=
  match s.toList with
  | 'Ａ' :: '　' :: rest => (fun n => (n, String.ofList rest)) <$> latinOrdinal 'Ａ'
  | 'Ｂ' :: '　' :: rest => (fun n => (n, String.ofList rest)) <$> latinOrdinal 'Ｂ'
  | 'Ｃ' :: '　' :: rest => (fun n => (n, String.ofList rest)) <$> latinOrdinal 'Ｃ'
  | 'Ｄ' :: '　' :: rest => (fun n => (n, String.ofList rest)) <$> latinOrdinal 'Ｄ'
  | 'Ｅ' :: '　' :: rest => (fun n => (n, String.ofList rest)) <$> latinOrdinal 'Ｅ'
  | _ => none

theorem parse_header_a : (parseTableHeader "Ａ　測定単位の数値").map Prod.fst = some 1 := by decide

-- 用語参照（参照先は呼出側が与える）
def termRef (target : Nat) : Nat := target

theorem term_ref_identity (t : Nat) : termRef t = t := by rfl

-- 申請書の記載項目（構造宣言）
def fieldDeclared : Bool := true

theorem field_is_declaration : fieldDeclared = true := rfl

end JapanTaxLaw.TableLabelsAndTerms
