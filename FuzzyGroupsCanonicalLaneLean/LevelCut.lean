import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FuzzyGroupsCanonicalLaneLean.FuzzySubgroup

namespace HautevilleHouse
namespace FuzzyGroupsCanonicalLaneLean

structure LevelCut (G : Type u) [Group G] (H : FuzzySubgroup G) where
  t : ℝ
  tInIcc : t ∈ Set.Icc (0 : ℝ) 1
  levelSet : Set G
  levelSetDefined : levelSet = {x : G | H.membership.carrier x ≥ t}

structure LevelCutEvidence (G : Type u) [Group G] (H : FuzzySubgroup G) (L : LevelCut G H) where
  tInIccClosed : L.tInIcc
  levelSetDefinedClosed : L.levelSetDefined

def LevelCutClosed (G : Type u) [Group G] (H : FuzzySubgroup G) (L : LevelCut G H) : Prop :=
  L.tInIcc ∧ L.levelSetDefined

theorem level_cut_closed_from_evidence (G : Type u) [Group G] (H : FuzzySubgroup G) (L : LevelCut G H) (E : LevelCutEvidence G H L) : LevelCutClosed G H L := by
  exact And.intro E.tInIccClosed E.levelSetDefinedClosed

theorem level_set_is_subgroup (G : Type u) [Group G] (H : FuzzySubgroup G) (L : LevelCut G H) : Subgroup G := by
  refine {
    carrier := L.levelSet
    one_mem' := ?_
    mul_mem' := ?_
    inv_mem' := ?_
  }
  · rw [L.levelSetDefined]
    have h : H.membership.carrier (1 : G) ≥ L.t := by
      have := H.one_mem
      have : H.membership.carrier (1 : G) = 1 := this
      rw [this]
      have : L.t ∈ Set.Icc (0 : ℝ) 1 := L.tInIcc
      exact this.2
    exact h
  · intro a b ha hb
    rw [L.levelSetDefined] at ha hb ⊢
    rw [Set.mem_setOf_eq] at ha hb ⊢
    have : H.membership.carrier (a * b) ≥ min (H.membership.carrier a) (H.membership.carrier b) := H.mul_mem a b
    have hmin : min (H.membership.carrier a) (H.membership.carrier b) ≥ L.t := by
      exact le_min ha hb
    exact le_trans hmin this
  · intro a ha
    rw [L.levelSetDefined] at ha ⊢
    rw [Set.mem_setOf_eq] at ha ⊢
    have : H.membership.carrier (a⁻¹) = H.membership.carrier a := H.inv_mem a
    rw [this]
    exact ha

end FuzzyGroupsCanonicalLaneLean
end HautevilleHouse