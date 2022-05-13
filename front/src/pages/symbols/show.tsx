import { Card, Col, DateField, Empty, Row, Show, Statistic, Switch, Tag, Typography } from "@pankod/refine-antd";
import { useShow } from "@pankod/refine-core";

import { Symbol } from "interfaces";
import { useState } from "react";

const { Title, Text } = Typography;

const tabList = [
    {
        key: 'general',
        tab: 'General',
    },
    {
        key: 'options',
        tab: 'Options',
    },
];

const contentList: any = {
    general: (record: Symbol) => <GeneralPane {...record} />,
    options: (record: Symbol) => <OptionsPane {...record} />,
};

export const SymbolShow = () => {
    const { queryResult } = useShow<Symbol>();
    const { data, isLoading } = queryResult;
    const record = data?.data;
    const [activeTabKey, setActiveTabKey] = useState('general');

    const onTabChange = (key: string) => {
        setActiveTabKey(key);
    };

    return (
        <Show title={record?.symbol || "N/A"} isLoading={isLoading}>
            <Card
                tabList={tabList}
                activeTabKey={activeTabKey}
                onTabChange={key => onTabChange(key)}
            >
                {contentList[activeTabKey](record)}
                <br />
                <Title level={5}>Last modified</Title>
                {record && <DateField format="LLL" value={record.time}></DateField>}
            </Card>
        </Show>
    );
};

const GeneralPane = ({
    symbol,
    currency,
    groupName,
    categoryName,
    description,
    leverage,
    pipsPrecision,
    contractSize,
    lotMin,
    lotStep,
    lotMax }: Symbol) => {
    return (
        <Card>
            <Row>
                <Col flex={3}>
                    <Title level={4}>Symbol</Title>
                    <Text>{symbol}</Text>

                    <Title level={5}>Currency</Title>
                    <Text>{currency}</Text>

                    <Title level={5}>Group</Title>
                    <Text>{groupName}</Text>

                    <Title level={5}>Category</Title>
                    <Text>{categoryName}</Text>


                    <Title level={5}>Description</Title>
                    <Text>{description}</Text>
                </Col>
                <Col flex={5}>
                    <Statistic title="Leverage" value={leverage} precision={2} />
                    <Statistic title="Pips precision" value={pipsPrecision} precision={2} />
                    <Statistic title="Contract size" value={contractSize} precision={2} />
                    <Statistic title="Lot min" value={lotMin} precision={2} />
                    <Statistic title="Lot step" value={lotStep} precision={2} />
                    <Statistic title="Lot max" value={lotMax} precision={2} />
                </Col>
            </Row>
        </Card>
    );
};

const OptionsPane = ({ longOnly, shortSelling }: Symbol) => {
    return (
        <Card>
            <Title level={5}>LongOnly</Title>
            <Switch checked={longOnly} disabled />

            <Title level={5}>Short selling</Title>
            <Switch checked={shortSelling} disabled />
        </Card>
    );
};