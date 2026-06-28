import std;

import type_list;

struct Fst;
struct Snd;
struct Trd;

template <typename Type>
struct Boxed;

template <typename Type>
using Box = Boxed<Type>;

template <typename Type>
struct KeepAll : std::true_type {};

template <typename Accumulator, typename Elem>
struct PushBackOne : std::type_identity<type_list::push_back_t<Accumulator, Elem>> {};

using List = type_list::from_pack_t<Fst, Snd, Trd>;
using Mapped = type_list::map_t<Box, List>;
using ExpectedMapped = type_list::from_pack_t<Boxed<Fst>, Boxed<Snd>, Boxed<Trd>>;

static_assert(std::same_as<Mapped, ExpectedMapped>);
static_assert(type_list::size_v<type_list::filter_t<KeepAll, List>> == 3);

using Folded = type_list::fold_left_t<type_list::nil, PushBackOne, List>;
static_assert(std::same_as<Folded, List>);

auto main() -> int {
    return 0;
}
