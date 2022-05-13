import {
    Button,
    Card,
    Col,
    Form,
    FormProps,
    getDefaultSortOrder,
    List,
    Row,
    Select,
    ShowButton,
    Space,
    Table,
    TextField,
    useSelect,
    useTable
} from "@pankod/refine-antd";
import { CrudFilters, HttpError } from "@pankod/refine-core";

import { Symbol, SymbolGroup, SymbolFilterProps, SymbolCategory } from "interfaces";

export const SymbolList = () => {
    const { tableProps, sorter, searchFormProps } = useTable<Symbol, HttpError, SymbolFilterProps>({
        initialSorter: [
            {
                field: "symbol",
                order: "asc",
            },
        ],
        onSearch: (params) => {
            const filters: CrudFilters = [];
            const { groupName, categoryName } = params;

            filters.push(
                {
                    field: "$.groupName",
                    operator: "eq",
                    value: groupName,
                },
                {
                    field: "$.categoryName",
                    operator: "eq",
                    value: categoryName,
                }
            );

            return filters;
        },
    });

    return (
        <Row gutter={[16, 16]}>
            <Col lg={6} xs={24}>
                <Card title="Filters">
                    <Filter formProps={searchFormProps} />
                </Card>
            </Col>
            <Col lg={18} xs={24}>
                <List>
                    <Table {...tableProps} rowKey="symbol">
                        <Table.Column
                            dataIndex="symbol"
                            key="symbol"
                            title="Symbol"
                            render={(value) => <TextField value={value} />}
                            defaultSortOrder={getDefaultSortOrder("symbol", sorter)}
                            sorter
                        />
                        <Table.Column
                            dataIndex="groupName"
                            key="groupName"
                            title="Group"
                            render={(value) => <TextField value={value} />}
                            defaultSortOrder={getDefaultSortOrder("groupName", sorter)}
                            sorter
                        />
                        <Table.Column
                            dataIndex="categoryName"
                            key="categoryName"
                            title="Category"
                            render={(value) => <TextField value={value} />}
                            defaultSortOrder={getDefaultSortOrder("categoryName", sorter)}
                            sorter
                        />
                        <Table.Column
                            dataIndex="description"
                            key="description"
                            title="Description"
                            render={(value) => <TextField value={value} />}
                            defaultSortOrder={getDefaultSortOrder("description", sorter)}
                            sorter
                        />
                        <Table.Column<Symbol>
                            title="Actions"
                            dataIndex="actions"
                            render={(_, record) => (
                                <Space>
                                    <ShowButton hideText size="small" recordItemId={record.symbol} />
                                </Space>
                            )}
                        />
                    </Table>
                </List>
            </Col>
        </Row>
    );
};

const Filter = ({ formProps }: { formProps: FormProps }) => {
    const { selectProps: groupSelectProps } = useSelect<SymbolGroup>({
        resource: "groups",
        optionLabel: "symbol",
        optionValue: "symbol",
        sort: [
            {
                field: "symbol",
                order: "asc"
            }
        ],
        fetchSize: 100
    });

    const { selectProps: categorySelectProps } = useSelect<SymbolCategory>({
        resource: "categories",
        optionLabel: "symbol",
        optionValue: "symbol",
        sort: [
            {
                field: "symbol",
                order: "asc"
            }
        ],
        fetchSize: 100
    });

    return (
        <Form layout="vertical" {...formProps}>
            <Form.Item label="Group" name="groupName">
                <Select
                    {...groupSelectProps}
                    allowClear
                    placeholder="Search Groups"
                />
            </Form.Item>
            <Form.Item label="Category" name="categoryName">
                <Select
                    {...categorySelectProps}
                    allowClear
                    placeholder="Search Categories"
                />
            </Form.Item>
            <Form.Item>
                <Button htmlType="submit" type="primary">
                    Filter
                </Button>
            </Form.Item>
        </Form>
    );
};