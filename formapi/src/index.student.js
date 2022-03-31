import React, {Component} from 'react';
import axios from 'axios';
import TableRowStudent from './TableRowStudent';
export default class IndexStudent extends Component {
    constructor(props) {
        super(props);
        this.state = {students: []};
    }

    componentDidMount() {
        axios.get('http://localhost:60444/students')
            .then(response => {
                console.log(response.data);
                this.setState({students: response.data});
            })
            .catch(function (error) {
                console.log(error);
            })
    }

    tabRow() {
        return this.state.students.map(function (object, i) {
            return <TableRowStudent obj={object} key={i}/>;
        });
    }

    render() {
        return (
            <div>
                <h3 align="center">Students List</h3>
                <table className="table table-striped" style={{marginTop: 20}}>
                    <thead>
                    <tr>
                        <th>Name</th>
                        <th>Uid</th>
                        <th>City</th>
                        <th>Zip Code</th>
                        <th>Phone Number</th>
                        <th>Class</th>
                        <th>Citizen ID</th>
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