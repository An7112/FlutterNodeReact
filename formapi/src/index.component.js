import React, {Component} from 'react';
import axios from 'axios';
import TableRow from './TableRow';
export default class Index extends Component {
    constructor(props) {
        super(props);
        this.state = {notifications: []};
    }

    componentDidMount() {
        axios.get('http://localhost:60444/notifications')
            .then(response => {
                console.log(response.data);
                this.setState({notifications: response.data});
            })
            .catch(function (error) {
                console.log(error);
            })
    }

    tabRow() {
        return this.state.notifications.map(function (object, i) {
            return <TableRow obj={object} key={i}/>;
        });
    }

    render() {
        return (
            <div>
                <h3 align="center">Notifications List</h3>
                <table className="table table-striped" style={{marginTop: 20}}>
                    <thead>
                    <tr>
                        <th>Sender</th>
                        <th>Title</th>
                        <th>Messeage</th>
                        <th>Send_to</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                    </thead>
                    <tbody>
                    {this.tabRow()}
                    </tbody>
                </table>
            </div>
        );
    }
}