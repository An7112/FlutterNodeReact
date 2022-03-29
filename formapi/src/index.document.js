import React, {Component} from 'react';
import axios from 'axios';
import TableRowDocument from './TableRowDocument';
export default class IndexDocument extends Component {
    constructor(props) {
        super(props);
        this.state = {documents: []};
    }

    componentDidMount() {
        axios.get('http://localhost:60444/documents')
            .then(response => {
                console.log(response.data);
                this.setState({documents: response.data});
            })
            .catch(function (error) {
                console.log(error);
            })
    }

    tabRowdocuments() {
        return this.state.documents.map(function (object, i) {
            return <TableRowDocument obj={object} key={i}/>;
        });
    }

    render() {
        return (
            <div>
                <h3 align="center">Documents List</h3>
                <table className="table table-striped" style={{marginTop: 20}}>
                    <thead>
                    <tr>
                        <th>Subject</th>
                        <th>Subject Title</th>
                        <th>Detail</th>
                        <th>Lecturers</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
                    </thead>
                    <tbody>
                    {this.tabRowdocuments()}
                    </tbody>
                </table>
            </div>
        );
    }
}