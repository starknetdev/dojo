use dojo_core::serde::SpanSerde;

#[abi]
trait IWorld {
    fn component(name: felt252) -> starknet::ClassHash;
    fn register_component(class_hash: starknet::ClassHash);
    fn system(name: felt252) -> starknet::ClassHash;
    fn register_system(class_hash: starknet::ClassHash);
    fn uuid() -> felt252;
    fn execute(name: felt252, execute_calldata: Span<felt252>) -> Span<felt252>;
    fn entity(
        component: felt252, key: dojo_core::storage::key::StorageKey, offset: u8, length: usize
    ) -> Span<felt252>;
    fn set_entity(
        component: felt252, key: dojo_core::storage::key::StorageKey, offset: u8, value: Span<felt252>
    );
    fn entities(component: felt252, partition: felt252) -> Array::<felt252>;
    fn has_role(role: felt252, account: starknet::ContractAddress) -> bool;
    fn grant_role(role: felt252, account: starknet::ContractAddress);
    fn revoke_role(role: felt252, account: starknet::ContractAddress);
    fn renounce_role(role: felt252);
    fn set_executor(contract_address: starknet::ContractAddress);
    fn set_indexer(class_hash: starknet::ClassHash);
    fn set_store(class_hash: starknet::ClassHash);
}

#[abi]
trait IExecutor {
    fn execute(class_hash: starknet::ClassHash, data: Span<felt252>) -> Span<felt252>;
}

#[abi]
trait IIndexer {
    fn index(table: felt252, id: felt252);
    fn records(table: felt252) -> Array::<felt252>;
}

#[abi]
trait IStore {
    fn get(
        table: felt252,
        class_hash: starknet::ClassHash,
        key: dojo_core::storage::key::StorageKey,
        offset: u8,
        length: usize
    ) -> Span<felt252>;
    fn set(
        table: felt252,
        class_hash: starknet::ClassHash,
        key: dojo_core::storage::key::StorageKey,
        offset: u8,
        value: Span<felt252>
    );
}

#[abi]
trait IComponent {
    fn name() -> felt252;
    fn len() -> usize;
}

#[abi]
trait ISystem {
    fn name() -> felt252;
}
